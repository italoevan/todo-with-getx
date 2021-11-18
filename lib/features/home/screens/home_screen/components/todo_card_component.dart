import 'package:flutter/material.dart';
import 'package:to_do_getx/core/models/home_models/todo.dart';

class TodoCardComponent extends StatelessWidget {
  final Todo todo;
  final VoidCallback? removeTap;
  final VoidCallback? editTap;

  TodoCardComponent(
      {Key? key, required this.todo, this.editTap, this.removeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        title: Text(todo.description ?? ""),
        leading: IconButton(
            onPressed: editTap,
            icon: Icon(
              Icons.edit,
              color: Colors.green,
            )),
        trailing:
            IconButton(onPressed: removeTap, icon: Icon(Icons.remove_circle)),
      ),
    );
  }
}
