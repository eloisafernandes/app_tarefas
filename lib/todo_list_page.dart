import 'package:app_tarefas/new_todo_widget.dart';
import 'package:app_tarefas/service_locator.dart';
import 'package:app_tarefas/todo_filter.dart';
import 'package:app_tarefas/todo_list_controller.dart';
import 'package:app_tarefas/todo_list_widget.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final controller = getIt<TodoListController>();
  static const List<Tab> tabs = [
    Tab(text: 'todas'),
    Tab(text: 'a fazer'),
    Tab(text: 'concluídas'),
  ];

  @override
  void initState(){
    controller.init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("To Do App"),
          bottom: TabBar(
            tabs: tabs,
            onTap: (index){
              controller.changeFilter(TodoFilter.values[index]);
            },
          ),
        ),
        body: ListView(
          children: [
            // widget para nova tarefa
            
            const NewTodoWidget(),
            TodoListWidget(),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
