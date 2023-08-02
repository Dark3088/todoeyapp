import 'dart:collection';

import 'package:flutter/foundation.dart';

class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void updateCheckbox() {
    isDone = !isDone;
  }
}

class TaskManager with ChangeNotifier {
  List<Task> _taskList = [];
  List<Task> get taskList => List.unmodifiable(_taskList);
  int get tasksCount => _taskList.length;

  void createNewTask({String taskText = ''}) {
    _taskList.add(Task(name: taskText));
    notifyListeners();
  }

  void initTasksList() {
    _taskList = [
      Task(name: 'Take a shower'),
      Task(name: 'Have some water'),
      Task(name: 'Sleep like a baby'),
    ];
  }

  updateTaskState(int taskIndex) {
    _taskList[taskIndex].updateCheckbox();
    notifyListeners();
  }

  void removeTaskAt({required int position}) {
    _taskList.removeAt(position);
    notifyListeners();
  }
}
