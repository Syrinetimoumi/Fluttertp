// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_model.dart';  // N'oubliez pas d'importer le modèle

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),  // Initialisation du modèle
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TodoList extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoModel = Provider.of<TodoModel>(context); // Accès au modèle

    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a task',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoModel.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoModel.todos[index]),
                  onLongPress: () => todoModel.removeTodoAtIndex(index), // Suppression de la tâche
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoModel.addTodo(_controller.text); // Ajout de la tâche
          _controller.clear(); // Effacement du champ de texte
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
