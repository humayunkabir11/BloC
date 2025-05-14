import 'package:blocs/todo_bloc.dart';
import 'package:blocs/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';
import 'counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(create: (_) => CounterBloc(),),
          BlocProvider<TodoBloc>(create: (_) => TodoBloc(),),
        ],
        child: const CounterScreen(),
      ),
    );
  }
}


