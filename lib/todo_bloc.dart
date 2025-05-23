import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([])) {
    on<AddToDo>((event, emit) {
      List<TodoModel> updatedList = List.from(state.todos)..add(event.todoModel);
      emit(TodoState(updatedList));
    });

    on<DeleteTodo>((event, emit) {
      for (var todo in state.todos) {
        print("eventid11: ${todo.id}");
      }
      final updatedList = state.todos.where((todo) => todo.id != event.id).toList();
      emit(TodoState(updatedList));
      print("eventid${event.id}");
    });
    on<UpdateTodo>((event, emit) {
      final updatedList = state.todos.map((todo) {
        return todo.id == event.updatedTodo.id ? event.updatedTodo : todo;
      }).toList();

      emit(TodoState(updatedList));
    });
  }
}
