import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/constants/color_constants.dart';
import 'package:todo_app/constants/padding_constants.dart';
import 'package:todo_app/provider/all_providers.dart';
import 'package:todo_app/widgets/title.dart';
import 'package:todo_app/widgets/todo_list_item.dart';
import 'package:todo_app/widgets/tool_bar.dart';
import 'package:uuid/uuid.dart';

import 'widgets/future_provider.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({Key? key}) : super(key: key);
  final newTodoController = TextEditingController();
  final uuid = const Uuid();

  @override

  /*  final List<TodoModel> _allTodos = [
    TodoModel(id: const Uuid().v4(), description: "Spora git"),
    TodoModel(id: const Uuid().v4(), description: "Alışveriş yAP"),
    TodoModel(id: const Uuid().v4(), description: "Ders Çalış"),
  ];
 */
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allTodos = ref.watch(filteredTodoList);
    return Scaffold(
      body: ListView(
        padding: PaddingConstants.instance.paddingSymmetric,
        children: [
          Wrap(),
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration: const InputDecoration(
              labelText: "Neler Yapacaksın Bugün ? ",
            ),
            onSubmitted: (newTodo) {
              ref.read(todoListProvider.notifier).addTodo(newTodo);
            },
            
          
          ),
          ToolBarWidget(),
          allTodos.isEmpty
              ? const Center(child: Text("tamamlanmiş görev yok "))
              : const SizedBox(),
          for (var i = 0; i < allTodos.length; i++)
            Dismissible(
              key: ValueKey(allTodos),
              child: ProviderScope(
                overrides: [
                  currentTodoProvider.overrideWithValue(allTodos[i]),
                ],
                child: const TodoListItemWidget(),
              ),
              onDismissed: (_) {
                ref.watch(todoListProvider.notifier).remove(allTodos[i]);
              },
            ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(color: ColorConstants.instance.green),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorConstants.instance.green)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const FutureProviderWidget())));
            },
            child: const Text("data")),
      ),
    );
  }
}
