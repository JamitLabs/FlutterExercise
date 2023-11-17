import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../widgets/add_todo_dialog.dart';
import '../widgets/todo_item.dart';

enum ToDoFilter {
  all,
  onlyDone,
  onlyNotDone,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todos = <ToDo>[];
  final _searchController = TextEditingController();
  String _searchTerm = '';
  ToDoFilter _filter = ToDoFilter.all;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _searchTerm = _searchController.text;
      });
    });
  }

  List<ToDo> _filterToDos() {
    return _todos
        // Apply search:
        .where((todo) => todo.text.toLowerCase().contains(_searchTerm.toLowerCase()))
        // Apply filter:
        .where((todo) =>
            _filter == ToDoFilter.all ||
            _filter == ToDoFilter.onlyDone && todo.isDone ||
            _filter == ToDoFilter.onlyNotDone && !todo.isDone)
        .toList();
  }

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
      body: Column(
        // The following line moves children that don't need the entire column
        // width to the left. By default they are positioned in the center.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Split sub-trees into methods to make the code more readable.
          _buildSearch(),
          _buildFilter(),
          const Divider(),
          Expanded(
            child: _buildList(),
          ),
        ],
      ),
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

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: const InputDecoration(
          // The hint text is shown when the text field input is empty.
          hintText: 'Type to search',
          icon: Icon(Icons.search_rounded),
        ),
        controller: _searchController,
      ),
    );
  }

  Widget _buildFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.filter_list_rounded),
          const SizedBox(width: 16),
          DropdownButton<ToDoFilter>(
            value: _filter,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(
                value: ToDoFilter.all,
                child: Text('All'),
              ),
              DropdownMenuItem(
                value: ToDoFilter.onlyDone,
                child: Text('Completed'),
              ),
              DropdownMenuItem(
                value: ToDoFilter.onlyNotDone,
                child: Text('Not completed'),
              ),
            ],
            onChanged: (filter) => setState(() {
              if (filter == null) return;
              _filter = filter;
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    final filtered = _filterToDos();

    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final todo = filtered[index];
        return ToDoItem(
          todo: todo,
          onDismissed: () => _removeToDo(todo.id),
          onIsDoneChanged: (isDone) => _changeIsDone(todo.id, isDone),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
