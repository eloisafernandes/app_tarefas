import 'package:flutter/material.dart';
import 'package:app_tarefas/todo.dart';

class TodoListNotifier extends ValueNotifier<List<Todo>>{

  TodoListNotifier() : super(_initialValue);

  static final List<Todo>  _initialValue = [
    Todo.create("task 1"),
    Todo.create("task 2"),
    Todo.create("task 3"),
    Todo.create("task 4"),
    Todo.create("task 5"),
  ];


}