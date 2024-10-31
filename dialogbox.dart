import 'package:flutter/material.dart';
import 'mybutton.dart';

class DialogBox extends StatelessWidget {
  final Controller;
  VoidCallback OnSave;
  VoidCallback OnCancel;

  DialogBox({super.key,
    required this.Controller,
    required this.OnSave,
    required this.OnCancel});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor:Colors.grey[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller:Controller,
              decoration:
            const InputDecoration(
                border: OutlineInputBorder(),
              hintText: "add new task",
            ),
    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                // save button
                MyButton(text: "save", OnPressed:OnSave),
                // cancel button

                MyButton(text: "cancel", OnPressed:OnCancel),
            ],
            )
          ],
        ),
      )
      
    );
  }
}