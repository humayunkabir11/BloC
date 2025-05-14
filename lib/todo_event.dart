part of 'todo_bloc.dart';


abstract class TodoEvent {}

class AddToDo extends TodoEvent{
  final TodoModel todoModel;
  AddToDo(this.todoModel);
}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo (this.id);
}
