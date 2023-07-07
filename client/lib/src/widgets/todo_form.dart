import 'package:client/src/models/todo.dart';
import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              label: Text("Title"),
            )
          ),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(
              label: Text("Description"),
            )
          ),
          ElevatedButton(
            onPressed: () {
              print("title ${titleController.text}");
              print("description ${descriptionController.text}");
              Navigator.pop<Todo>(context, Todo(id: "1", title: titleController.text, description: descriptionController.text, state: TodoState.inProgress));
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
