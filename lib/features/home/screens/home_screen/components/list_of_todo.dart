import 'package:flutter/material.dart';
import 'package:to_do_getx/features/home/screens/home_screen/components/todo_card_component.dart';
import 'package:to_do_getx/features/home/screens/home_screen/home_controller.dart';

class TodoList extends StatelessWidget {
  final HomeController controller;

  TodoList({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.listOfTodo.isEmpty
        ? Center(
            child: Text("Lista vazia"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listOfTodo.length,
            itemBuilder: (context, index) => TodoCardComponent(
                todo: controller.listOfTodo[index],
                editTap: () => controller.onActionEditTap(
                    context: context,
                    model: controller.listOfTodo.value[index]),
                removeTap: () => controller
                    .removeById(controller.listOfTodo.value[index].id ?? 0)),
          );
  }
}
