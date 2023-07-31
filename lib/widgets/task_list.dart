import 'package:flutter/material.dart';
import 'package:todoeyapp/widgets/task_tile.dart';
import '../models/task.dart';

var taskManager = TaskManager();

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> taskList = taskManager.getTasksList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CheckboxTile(
          name: taskList[index].name,
          checkboxState: taskList[index].isDone,
          onUpdateCheckbox: (newState) => setState(() {
            taskManager.updateTaskState(index);
          }),
        );
      },
      itemCount: taskList.length,
    );
  }
}
