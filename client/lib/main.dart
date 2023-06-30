import 'package:client/src/todo_list_provider.dart';
import 'package:client/src/widgets/todo_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:client/src/models/todo.dart';
import 'package:client/src/widgets/todo_item_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Provider(
        create: (_) => TodoListProvider(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo List'),
      ),
      body: const TodoListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoListProvider>().createTodo(Todo(
            id: context.read<TodoListProvider>().todoList.length.toString(),
            title: "test todo 3",
            description: "test description 3",
            state: TodoState.inProgress,
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
