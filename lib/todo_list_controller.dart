import 'package:app_tarefas/todo.dart';
import 'package:app_tarefas/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();

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
 
}