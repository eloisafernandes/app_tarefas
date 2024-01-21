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
  }
  void onToggled(_){
    print(_);
  }

  void onDeleted(){
    print("deletado");
  }
}