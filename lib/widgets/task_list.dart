import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskManager,
  });

  final TaskManager taskManager;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: taskManager,
      builder: (context, child) => ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        itemCount: taskManager.tasksCount,
        itemBuilder: (BuildContext context, int curTask) {
          final task = taskManager.taskList[curTask];
          return InkWell(
            onLongPress: () => taskManager.removeTaskAt(position: curTask),
            child: CheckboxListTile(
              title: Text(task.name,
                  style: TextStyle(
                    decoration: task.isDone ? TextDecoration.lineThrough : null,
                  )),
              value: task.isDone,
              onChanged: (latestState) {
                taskManager.updateTaskState(curTask);
              },
            ),
          );
        },
      ),
    );
  }
}
