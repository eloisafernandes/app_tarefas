import 'package:flutter/material.dart';
import 'package:app_tarefas/todo.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({super.key, required this.todo});

  final Todo todo;
  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late TextEditingController todoController;
  
  @override
  void initState(){
    todoController = TextEditingController(text: widget.todo.task);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: todoController,
      )
    );
  }
}