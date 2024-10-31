import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;

  Todotile({super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletefunction});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
        child: Slidable(
          endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deletefunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),)
            ]),

        child: Container(
        padding: const EdgeInsets.all(22.0),
        decoration: BoxDecoration(
        color:Colors.grey,
        borderRadius:BorderRadius.circular(15)
        ),

        child: Row(
        children: [
    //check box
          Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.black,
    ),

    //task name
          Text(taskName,
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration:taskCompleted ?
          TextDecoration.lineThrough :
          TextDecoration.none ,
          ),),
          ],
          )
    ,
     ),
        ),
    );
  }
}