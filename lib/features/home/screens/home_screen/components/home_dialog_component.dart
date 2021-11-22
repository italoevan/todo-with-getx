import 'package:flutter/material.dart';

class HomeDialogComponent extends StatelessWidget {
  final TextEditingController controller;
  final String buttonText;
  final Function onTap;
  const HomeDialogComponent({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Descrição"),
              controller: controller,
            ),
            ElevatedButton(onPressed: () => onTap(), child: Text(buttonText))
          ],
        ),
      ),
    );
  }
}
