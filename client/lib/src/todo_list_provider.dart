import 'package:client/src/models/todo.dart';
import 'package:flutter/material.dart';

class TodoListProvider extends ChangeNotifier {
  final List<Todo> _todoList = [
    Todo(
      id: "1",
      title: "test todo",
      state: TodoState.inProgress,
    ),
    Todo(
      id: "2",
      title: "test todo 2",
      description: "test description",
      state: TodoState.done,
    ),
  ];

  List<Todo> get todoList => _todoList;

  void createTodo(Todo todo) {
    _todoList.add(todo);
    notifyListeners();
  }
}
