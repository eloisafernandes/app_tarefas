import 'package:app_tarefas/todo.dart';
import 'package:app_tarefas/todo_filter.dart';
import 'package:app_tarefas/todo_list_notifier.dart';
import 'package:flutter/material.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();
  final filterNotifier = ValueNotifier<TodoFilter>(TodoFilter.all);

  void init(){
    todoListNotifier.init();
    filterNotifier.addListener(() => todoListNotifier.changeFilter(filterNotifier.value));
  }
  void update(String id, String task)  {
    todoListNotifier.update(id, task);
  }
  void toogle(String id)  {
    todoListNotifier.toggle(id);
  }

  void remove(String id)  {
    todoListNotifier.remove(id);
  }
  void add(String task)  {
    todoListNotifier.add(Todo.create(task));
  }

  void changeFilter(TodoFilter filter){
    filterNotifier.value = filter;
    print(filter);
  }

  
 
}