import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neha_todo_app/authentication.dart';
import 'package:neha_todo_app/login_page.dart';
import 'package:neha_todo_app/profile_page.dart';
import 'package:neha_todo_app/task.dart';
import 'package:firebase_core/firebase_core.dart';

import 'todo_create.dart';
import 'todo_list.dart';

// set entry point for theapp
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Todo();
  }
}

class Todo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoState();
  }
}


// This is the state of todo widget
class TodoState extends State<Todo> {
  final List<Task> tasks = [
    Task("Finish the app", false),
    Task('Imagine the idea', true)
  ];
  final Authentication auth = Authentication();


  void onTaskCreated(String name){
    setState(() {
      tasks.add(Task(name, false));
    });
  }

  void onTaskToggled(Task task) {
    setState(() {
      task.setCompleted(!task.isCompleted());
    });
  }
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      initialRoute: '/',
      routes: {
        //Screen for viewing task
        '/': (context) => LoginPage(),
        '/profile': (context) => ProfilePage(user: user!),
        '/list': (context) => TodoList(tasks: tasks, onToggle: onTaskToggled),
        //Screen to create tasks
        '/create': (context) => TodoCreate(onCreate: onTaskCreated,),
      },
    );
  }
}



