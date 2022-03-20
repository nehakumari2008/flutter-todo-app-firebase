import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neha_todo_app/task.dart';

class TodoList extends StatelessWidget {
  final List<Task> tasks;
  final onToggle;

  // Recieving tasks from parent widget
  TodoList({required this.tasks, required this.onToggle});
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP'),
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(tasks[index].getName()),
              value: tasks[index].isCompleted(),
              onChanged: (_) => onToggle(tasks[index]),
            );
          }),
      // Button to create new task
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              child: Text('TODO Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('View Profile'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}