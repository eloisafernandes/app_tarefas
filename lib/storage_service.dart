import 'package:app_tarefas/todo.dart';

abstract class StorageService{
  Future<List<Todo> >getTodos();
  Future<void> saveTodos(List<Todo> todos);
}