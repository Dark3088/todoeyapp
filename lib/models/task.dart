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

  List<Task> taskList = [
    Task(name: 'Take a shower'),
    Task(name: 'Have some water'),
    Task(name: 'Sleep like a baby'),
  ];

  List<Task> createNewTask({String taskText = ''}) {
    taskList.add(Task(name: taskText));
    return taskList;
  }

  List<Task> getTasksList() => taskList;

  void updateTaskState(int taskIndex) => taskList[taskIndex].updateCheckbox();

  void removeTaskAt({required int position}) {
    taskList.removeAt(position);
  }
}
