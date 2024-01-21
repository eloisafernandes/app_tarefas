import 'package:app_tarefas/service_locator.dart';
import 'package:app_tarefas/todo_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_tarefas/todo.dart';

class NewTodoWidget extends StatefulWidget {
  const NewTodoWidget({super.key,});


  @override
  State<NewTodoWidget> createState() => _NewTodoWidgetState();
}

class _NewTodoWidgetState extends State<NewTodoWidget> {
  late TextEditingController todoController = TextEditingController();
  final controller = getIt<TodoListController>();
  final todoNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();

  }
  
  bool contemApenasNumeros(String input) {
    final regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(input);
  }

  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Form(
        key:formKey,
        child: TextFormField(
          focusNode: todoNode,
          controller: todoController,
          decoration: InputDecoration.collapsed(
            hintText: 'Escreva uma nova tarefa...'
          ),
          validator: (v) {
            if (v == null || v.isEmpty){
              return "Não pode ser vazio";
            }
            else if(contemApenasNumeros(v)){
              return "Não pode conter apenas números";
            }
            return null;
          },
          onFieldSubmitted: (_) => onSubmitted(),
        
        ),
      ),
      leading: Checkbox(
        onChanged: null,
        value: false,
      ),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: onSubmitted,
        color: Colors.lightGreen[900],
        visualDensity: VisualDensity.compact,
      ),
    );
  }

  void onChanged(String task){
  }

  void onSubmitted(){
    if (!formKey.currentState!.validate()){
      return;
    }
    controller.add(todoController.text);
    formKey.currentState!.reset();
    todoNode.unfocus();
  }
}