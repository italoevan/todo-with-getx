import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/core/models/home_models/todo.dart';
import 'package:to_do_getx/features/home/data/to_do_dao.dart';

abstract class HomeController {
  bool get isLoading;
  Future<void>? getList();
  RxList<Todo> get listOfTodo;
  Future<void> removeById(int i);
  Future<void> insert(Todo model);
  Future<void> edit(Todo model, String newDescription);
  void onActionButtonTap(BuildContext context);
  void onActionEditTap({
    required BuildContext context,
    required Todo model,
  });
}

class HomeControllerImpl extends GetxController implements HomeController {
  var list = <Todo>[].obs;
  @override
  bool get isLoading => isListLoading.value;
  var isListLoading = true.obs;

  @override
  void onInit() async {
    // await TodoDao.insert(Todo(description: "Testando legal"));

    await getList();

    super.onInit();
  }

  @override
  RxList<Todo> get listOfTodo => list;

  @override
  Future<void>? getList() async {
    try {
      list.value = await TodoDao.read();
      isListLoading.value = false;
    } on Exception {
      printError();
      isListLoading.value = false;
    }
  }

  @override
  Future<void> removeById(int id) async {
    isListLoading.value = true;
    try {
      await TodoDao.removeById(id);
      await getList();
      list.refresh();
    } on Exception {
      print("Error");
    }
  }

  @override
  Future<void> insert(Todo model) async {
    isListLoading.value = true;

    try {
      await TodoDao.insert(model);
      await getList();
      list.refresh();
    } on Exception {
      print("Error");
    }
  }

  @override
  Future<void> edit(Todo model, String newDescription) async {
    isListLoading.value = true;
    model.description = newDescription;

    try {
      await TodoDao.edit(model);
      await getList();
      list.refresh();
    } on Exception {
      print("Error");
    }
  }

  @override
  void onActionButtonTap(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "Descrição"),
                      controller: descriptionController,
                    ),
                    Divider(),
                    ElevatedButton(
                        onPressed: () => insert(Todo(
                                    description: descriptionController.text))
                                .whenComplete(
                              () => Navigator.pop(context),
                            ),
                        child: Text("Salvar"))
                  ],
                ),
              ),
            ));
  }

  @override
  void onActionEditTap({
    required BuildContext context,
    required Todo model,
  }) {
    TextEditingController descriptionController =
        TextEditingController(text: model.description);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: "Descrição"),
                      controller: descriptionController,
                    ),
                    Divider(),
                    ElevatedButton(
                        onPressed: () => edit(model, descriptionController.text)
                                .whenComplete(
                              () => Navigator.pop(context),
                            ),
                        child: Text("Salvar"))
                  ],
                ),
              ),
            ));
  }
}
