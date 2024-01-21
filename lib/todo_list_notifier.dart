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

  void update(String id, String task){
    value = [
      for (final todo in value)
        if (todo.id != id) todo else todo.copyWith(task: task)
    ];
  }

  void toggle(String id){
    value = [
      for (final todo in value)
        if (todo.id != id) todo else todo.copyWith(completed: !todo.completed)
    ];
  }
  void remove(String id){
    value = value.where((todo) => todo.id != id).toList();
  }

}