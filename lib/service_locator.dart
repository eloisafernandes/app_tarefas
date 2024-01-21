import 'package:app_tarefas/todo_list_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt(){
  getIt.registerLazySingleton<TodoListController>(() => TodoListController()) ; 
}