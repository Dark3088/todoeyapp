import 'package:flutter/material.dart';
import 'package:todoeyapp/widgets/task_tile.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
    required this.updateCheckbox,
  });
  final List<Task> taskList;
  final Function updateCheckbox;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CheckboxTile(
          name: taskList[index].name,
          checkboxState: taskList[index].isDone,
          onUpdateCheckbox: (taskState) => updateCheckbox(index),
        );
      },
      itemCount: taskList.length,
    );
  }
}
