import 'package:flutter/material.dart';

import 'package:trail/util/todotile.dart';
import '../util/dialogbox.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // This widget is the root of your application.

  final _controller= TextEditingController();

  List todolist =[
    ["hi",true],
    ["to do",false],
  ];

  void checkbox(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
      _controller.clear();
    });
  }

  void textsave(){
    setState(() {
      todolist.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
  }

  void createnewtask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        Controller:_controller ,
        OnSave: textsave,
        OnCancel: () => Navigator.of(context).pop,);
    });
  }

  void deletetask(int index){
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200],
      appBar: AppBar(
        title: Text("TO DO",style:TextStyle(fontWeight: FontWeight.bold),),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:createnewtask,
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context ,index){
          return Todotile(
              taskName:todolist [index][0],
              taskCompleted: todolist [index][1],
              onChanged:(value) => checkbox(value,index),
              deletefunction:(context) => deletetask(index),
          );
        }

      ),

    );
  }
}
