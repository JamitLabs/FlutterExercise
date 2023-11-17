import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../widgets/add_todo_dialog.dart';
import '../widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todos = <ToDo>[];

  void _addNewToDo(ToDo todo) {
    setState(() {
      _todos.insert(0, todo);
    });
  }

  void _removeToDo(int id) {
    setState(() {
      _todos.removeWhere((element) => element.id == id);
    });
  }

  void _changeIsDone(int id, bool isDone) {
    setState(() {
      final index = _todos.indexWhere((element) => element.id == id);
      final todo = _todos[index];
      final newTodo = todo.copyWith(isDone: isDone);
      _todos[index] = newTodo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddToDoDialog(
              onAddToDoPressed: _addNewToDo,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _todos.length,
      itemBuilder: (context, index) {
        final todo = _todos[index];
        return ToDoItem(
          todo: todo,
          onDismissed: () => _removeToDo(todo.id),
          onIsDoneChanged: (isDone) => _changeIsDone(todo.id, isDone),
        );
      },
    );
  }
}
