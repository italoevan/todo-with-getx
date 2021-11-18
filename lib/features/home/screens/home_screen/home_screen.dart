import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx/features/home/screens/home_screen/components/todo_card_component.dart';
import 'package:to_do_getx/features/home/screens/home_screen/home_controller.dart';

import 'components/list_of_todo.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller;

  HomeScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do GetX"),
      ),
      body: Container(
        child: Obx(() => controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : ListOfTodoComponent(
                controller: controller,
              )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onActionButtonTap(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
