import 'package:flutter/material.dart';

import '../models/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    required this.todo,
    required this.onIsDoneChanged,
    super.key,
  });

  final ToDo todo;

  final void Function(bool isDone) onIsDoneChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              todo.text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(width: 8),
          Checkbox(
            value: todo.isDone,
            onChanged: (isDone) {
              if (isDone == null) return;

              onIsDoneChanged(isDone);
            },
          ),
        ],
      ),
    );
  }
}
