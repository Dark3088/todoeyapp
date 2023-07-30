import 'package:flutter/material.dart';
import 'package:todoeyapp/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    required this.isTaskChecked,
    required this.onTaskChecked,
    super.key,
  });

  final bool isTaskChecked;
  final Function(bool) onTaskChecked;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        top: 30,
        left: 12,
        right: 12,
        bottom: 30,
      ),
      children: const [
        TaskTile(),
        TaskTile(),
        TaskTile(),
        TaskTile(),
        TaskTile(),
      ],
    );
  }
}
