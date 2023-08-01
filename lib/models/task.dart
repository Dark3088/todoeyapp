class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void updateCheckbox() {
    isDone = !isDone;
  }
}

class TaskManager {
  TaskManager();

  List<Task> _taskList = [];
  List<Task> getTaskList() => _taskList;

  List<Task> createNewTask({String taskText = ''}) {
    _taskList.add(Task(name: taskText));
    return _taskList;
  }

  void initTasksList() {
    _taskList = [
      Task(name: 'Take a shower'),
      Task(name: 'Have some water'),
      Task(name: 'Sleep like a baby'),
    ];
  }

  List<Task> updateTaskState(int taskIndex) {
    _taskList[taskIndex].updateCheckbox();
    return _taskList;
  }

  void removeTaskAt({required int position}) {
    _taskList.removeAt(position);
  }
}
