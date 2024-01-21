import 'package:app_tarefas/service_locator.dart';
import 'package:app_tarefas/todo_item_widget.dart';
import 'package:app_tarefas/todo_list_controller.dart';
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
  TodoListWidget({super.key});

  final controller = getIt<TodoListController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.todoListNotifier, 
      builder:(context, todoList, child){
        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: todoList.length,
          itemBuilder: (context, index)  {
            final todo = todoList[index];
            return TodoItemWidget( key: ValueKey(todo.id) , todo: todoList[index]);
          },
        );
      }
    );
  }
}