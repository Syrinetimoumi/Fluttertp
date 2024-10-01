// todo_model.dart
import 'package:flutter/foundation.dart';

class TodoModel extends ChangeNotifier {
  List<String> _todos = [];

  List<String> get todos => _todos;

  void addTodo(String todo) {
    if (todo.isNotEmpty) {
      _todos.add(todo);
      notifyListeners();  // Notifie les écouteurs pour mettre à jour l'UI
    }
  }

  void removeTodoAtIndex(int index) {
    _todos.removeAt(index);
    notifyListeners();  // Notifie les écouteurs pour mettre à jour l'UI
  }
}
