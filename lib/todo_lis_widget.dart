import 'package:flutter/material.dart';
import 'package:app_tarefas/todo.dart';

List<Todo>  todoList = [
  Todo.create("task 1"),
  Todo.create("task 2"),
  Todo.create("task 3"),
  Todo.create("task 4"),
  Todo.create("task sei la"),
];

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: todoList.length,
      itemBuilder: (context, index)  {
        return ListTile(
          title: Text(todoList[index].task),
        );
      },
    );
  }
}