
import 'package:flutter/material.dart';

class TodoCreate extends StatefulWidget {
  final onCreate;
  TodoCreate({required this.onCreate});

  @override
  State<StatefulWidget> createState() {
    return TodoCreateState();
  }
}

class TodoCreateState extends State<TodoCreate> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Create a task')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            //open keyboard automatically
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
                labelText: 'Enter new task'
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: (){
          //Call the callback with new task name
          widget.onCreate(controller.text);
          // Go back
          Navigator.pop(context);
        },
      ),
    );
  }
}