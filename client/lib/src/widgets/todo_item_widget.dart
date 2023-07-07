import 'package:client/src/models/todo.dart';
import 'package:client/src/todo_list_provider.dart';
import 'package:client/src/widgets/responsive_button.dart';
import 'package:client/src/widgets/todo_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(this.todo, {super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    print(todo);
    return ListTile(
      title: Text(todo.title),
      subtitle: todo.description == null ? null : Text(todo.description!),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ResponsiveButton(icon: const Icon(Icons.edit), onPressed: () async {
            final Todo? todo = await showDialog(context: context, builder: (BuildContext context) {
              return const Dialog(child: TodoForm());
            });
            print(todo);

            // ignore: use_build_context_synchronously
            context.read<TodoListProvider>().updateTodoById(todo!.id, todo);
          }, text: 'Edit'),
          const SizedBox(width: 12),
          ResponsiveButton(icon: const Icon(Icons.delete), onPressed: () {
            context.read<TodoListProvider>().deleteTodoById(todo.id);
          }, text: 'Delete'),
        ],
      ),
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: todo.title))
            .then((value) =>
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copied to clipboard"))))
            .catchError((error) => ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Failed to copy to clipboard"))));
      },
    );
  }
}
