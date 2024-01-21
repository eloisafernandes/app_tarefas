import 'package:app_tarefas/new_todo_widget.dart';
import 'package:app_tarefas/todo_list_widget.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("To Do App"),
      ),
      body: ListView(
        children: [
          // widget para nova tarefa
          const NewTodoWidget(),
          TodoListWidget(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
