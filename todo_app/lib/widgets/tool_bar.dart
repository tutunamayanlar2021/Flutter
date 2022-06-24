import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/constants/color_constants.dart';
import 'package:todo_app/provider/all_providers.dart';

// ignore: must_be_immutable
class ToolBarWidget extends ConsumerWidget {
  ToolBarWidget({Key? key}) : super(key: key);
  var _currenFilter = TodolistFilter.all;
  Color changeTextColor(TodolistFilter filter) {
    return _currenFilter == filter
        ? ColorConstants.instance.green
        : ColorConstants.instance.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// final unCompletedTodoCount=ref.watch(UnCompletedTodoCount);
    _currenFilter = ref.watch(todoListFilter);
    int unCompletedCount = ref
        .watch(todoListProvider)
        .where((element) => !element.completed)
        .length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            unCompletedCount == 0
                ? "Bütün görevler tamamlandı"
                : "$unCompletedCount tane görev tamamlanmadı sdfhhjds",
          ),
        ),
        Tooltip(
          message: "All Tasks",
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodolistFilter.all)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodolistFilter.all;
            },
            child: const Text("All"),
          ),
        ),
        Tooltip(
          message: "Uncomplete Tasks",
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodolistFilter.active)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state = TodolistFilter.active;
            },
            child: const Text("Active"),
          ),
        ),
        Tooltip(
          message: "Complete Tasks",
          child: TextButton(
            style: TextButton.styleFrom(
                primary: changeTextColor(TodolistFilter.completed)),
            onPressed: () {
              ref.read(todoListFilter.notifier).state =
                  TodolistFilter.completed;
            },
            child: const Text("Complete"),
          ),
        )
      ],
    );
  }
}
