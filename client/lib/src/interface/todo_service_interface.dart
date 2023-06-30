import 'package:client/src/models/todo.dart';

abstract class TodoServiceInterface {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodoById(String id);
  Future<Todo> createTodo(
    String title,
    String description,
    String status,
  );
  Future<Todo> updateTodo(
    String id,
    String title,
    String description,
    String status,
  );
  Future<void> deleteTodoById(String id);
}