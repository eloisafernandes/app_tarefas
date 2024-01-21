import 'package:app_tarefas/service_locator.dart';
import 'package:app_tarefas/todo_list_controller.dart';
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
  final controller = getIt<TodoListController>();

  @override
  void initState(){
    todoController = TextEditingController(text: widget.todo.task);
    super.initState();

  }
  

  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: todoController,
        decoration: InputDecoration.collapsed(hintText: 'escreva sua tarefa...'),
        onChanged: onChanged
      ),
      leading: Checkbox(
        onChanged: onToggled,
        value: widget.todo.completed,
      ),
      trailing: IconButton(
        icon: Icon(Icons.close_rounded),
        onPressed: onDeleted,
        visualDensity: VisualDensity.compact,
      ),
    );
  }

  void onChanged(String task){
    print(task);
    controller.update(widget.todo.id, task);
  }
  void onToggled(_){
    print(_);
    controller.toogle(widget.todo.id);
  }

  void onDeleted(){
    controller.remove(widget.todo.id);
  }
}