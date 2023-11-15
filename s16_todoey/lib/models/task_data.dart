import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _todoList = [
    Task(name: 'Buy Egg'),
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Flour'),
  ];

  UnmodifiableListView get todoList {
    return UnmodifiableListView(_todoList);
  }

  void addTodo(String todoTitle) {
    _todoList.add(Task(name: todoTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    print(task.isDone);
    notifyListeners();
  }

  void deleteTask(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }

  int get todoCount {
    return _todoList.length;
  }
}
