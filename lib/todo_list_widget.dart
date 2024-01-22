import 'package:app_tarefas/service_locator.dart';
import 'package:app_tarefas/todo_filter.dart';
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
        var isFilterAll = controller.filterNotifier.value == TodoFilter.all;

        if (todoList.isEmpty && !isFilterAll){
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Nada a exibir"),
            ),
          );
        }
        return ReorderableListView.builder(
          primary: false,
          shrinkWrap: true,
          buildDefaultDragHandles: isFilterAll,
          itemCount: todoList.length,
          onReorder:controller.onReorder,
          itemBuilder: (context, index)  {
            final todo = todoList[index];
            return TodoItemWidget( key: ValueKey(todo.id) , todo: todo);
          },
        );
      }
    );
  }
}