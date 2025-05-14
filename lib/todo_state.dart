part of 'todo_bloc.dart';



class TodoState {
 final List<TodoModel> todos;
 TodoState(this.todos);
}



// models/todo.dart
class TodoModel {
 final String id;
 final String title;

 TodoModel({
  required this.id,
  required this.title,
 });
 factory TodoModel.fromJson(Map<String, dynamic> json) {
  return TodoModel(
   id: json['id'],
   title: json['title'],
  );
 }

 Map<String, dynamic> toJson() => {
  'id': id,
  'title': title,
 };

}
