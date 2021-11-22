import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/features/home/navigator/home_navigator.dart';
import '../../../../core/models/home_models/todo.dart';
import '../../data/to_do_dao.dart';
import 'components/home_dialog_component.dart';

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
  final HomeNavigator navigator;
  HomeControllerImpl(this.navigator);

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
      debugPrint("Error");
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
      debugPrint("Error");
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
      debugPrint("Error");
    }
  }

  @override
  void onActionButtonTap(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => HomeDialogComponent(
              buttonText: "Salvar",
              controller: descriptionController,
              onTap: () => insert(Todo(description: descriptionController.text))
                  .whenComplete(
                () => Navigator.pop(context),
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
        builder: (context) => HomeDialogComponent(
              buttonText: "Salvar",
              controller: descriptionController,
              onTap: () => edit(model, descriptionController.text)
                  .whenComplete(() => Navigator.pop(context)),
            ));
  }
}
