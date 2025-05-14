
import 'package:blocs/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  final uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text("Todo App using BLoC")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final title = _controller.text.trim();
              if (title.isNotEmpty) {
                final newTodo = TodoModel(id: uuid.v4(), title: title);
                todoBloc.add(AddToDo(newTodo));
                _controller.clear();
              }
            },
            child: const Text("Add Task"),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          todoBloc.add(DeleteTodo(todo.id));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
