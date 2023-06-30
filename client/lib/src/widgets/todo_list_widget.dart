import 'package:client/src/models/todo.dart';
import 'package:client/src/todo_list_provider.dart';
import 'package:client/src/widgets/todo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Todo> todoList = context.watch<TodoListProvider>().todoList;
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (_, int index) {
          return TodoItem(todoList[index]);
        });
  }
}