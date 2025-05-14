import 'package:blocs/todo_bloc.dart';
import 'package:blocs/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cunter With Bloc"),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              "Counter : ${state.count}",
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(Increment());
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => counterBloc.add(Decrement())),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => TodoBloc(),
                    child: TodoScreen(),
                  ),
                ),
              );
            },
            child: Text("ToDo"),
          ),
        ],
      ),
    );
  }
}
