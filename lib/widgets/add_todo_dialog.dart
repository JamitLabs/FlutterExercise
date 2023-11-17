import 'package:flutter/material.dart';

import '../models/todo.dart';

class AddToDoDialog extends StatefulWidget {
  const AddToDoDialog({
    required this.onAddToDoPressed,
    super.key,
  });

  final void Function(ToDo) onAddToDoPressed;

  @override
  State<AddToDoDialog> createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Automatically set the focus to the text field when this dialog is opened.
    // This will also open the device keyboard.
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add item'),
      content: TextField(
        controller: _controller,
        focusNode: _focusNode,
        // onSubmitted is called when the enter or confirm key on the keyboard
        // is pressed.
        onSubmitted: (_) => _onAddItemPressed(),
      ),
      actions: [
        TextButton(
          onPressed: _onAddItemPressed,
          child: const Text('Add'),
        ),
      ],
    );
  }

  void _onAddItemPressed() {
    final text = _controller.text;
    // Use the current timestamp as a unique ID.
    final id = DateTime.now().millisecondsSinceEpoch;
    final newItem = ToDo(id: id, text: text);

    widget.onAddToDoPressed(newItem);
    // Close the dialog.
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
