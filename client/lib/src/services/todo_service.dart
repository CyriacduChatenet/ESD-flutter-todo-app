import 'package:client/src/interface/todo_service_interface.dart';
import 'package:client/src/models/todo.dart';

class TodoService implements TodoServiceInterface {
  @override
  Future<Todo> createTodo(
    String title,
    String description,
    String status,
  ) async {
    return Todo(
      id: '1',
      title: title,
      description: description,
      state: TodoState.inProgress,
    );
  }

  @override
  Future<List<Todo>> getTodos() async {
    return [
      Todo(
        id: '1',
        title: 'Todo Title',
        description: 'Todo Description',
        state: TodoState.inProgress,
      ),
      Todo(
        id: '2',
        title: 'Todo Title',
        description: 'Todo Description',
        state: TodoState.inProgress,
      ),
      Todo(
        id: '3',
        title: 'Todo Title',
        description: 'Todo Description',
        state: TodoState.inProgress,
      ),
    ];
  }

  @override
  Future<Todo> getTodoById(String id) async {
    return Todo(
      id: id,
      title: 'Todo Title',
      description: 'Todo Description',
      state: TodoState.inProgress,
    );
  }

  @override
  Future<Todo> updateTodo(
    String id,
    String title,
    String description,
    String status,
  ) async {
    return Todo(
      id: id,
      title: title,
      description: description, state: TodoState.inProgress,
    );
  }

  @override
  Future<void> deleteTodoById(String id) async {}
}
