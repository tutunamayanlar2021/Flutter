import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/todo_list_manager.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

enum TodolistFilter { all, active, completed }

final todoListFilter =
    StateProvider<TodolistFilter>((ref) => TodolistFilter.all);
final filteredTodoList = Provider<List<TodoModel>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todoList = ref.watch(todoListProvider);
  switch (filter) {
    case TodolistFilter.all:
      return todoList;
    case TodolistFilter.active:
      return todoList.where((element) => !element.completed).toList();
    case TodolistFilter.completed:
      return todoList.where((element) => element.completed).toList();
   
  }
});
final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>((ref) {
  return TodoListManager([
    TodoModel(id: const Uuid().v4(), description: "Spora git"),
    TodoModel(id: const Uuid().v4(), description: "Alişveriş yap"),
    TodoModel(id: const Uuid().v4(), description: "Ders Çaliş"),
    TodoModel(id: const Uuid().v4(), description: "Tv izle")
  ]);
});
final unCompletedTodoCount = Provider<int>(((ref) {
  final allTodo = ref.watch(todoListProvider);
  final count = allTodo.where((element) => element.completed).length;
  return count;
}));
final currentTodoProvider = Provider<TodoModel>(((ref) {
  throw UnimplementedError();
}));
