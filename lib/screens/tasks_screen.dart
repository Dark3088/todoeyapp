import 'package:flutter/material.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatelessWidget {
  final void Function(bool) onTaskSelected;
  final bool isTaskSelected;
  const TasksScreen({
    super.key,
    required this.onTaskSelected,
    required this.isTaskSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {},
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '12 Tasks',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ]),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: TaskList(
                isTaskChecked: isTaskSelected,
                onTaskChecked: (value) => onTaskSelected(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<CheckboxListTile> generateTaskList({
  required void Function(bool) onChecked,
  bool isChecked = false,
}) {
  List<CheckboxListTile> tasks = [];
  List.generate(5, (index) {
    tasks.add(CheckboxListTile(
      title: Text('Task Number ${index + 1}'),
      value: isChecked,
      onChanged: (isTaskChecked) => onChecked(isTaskChecked!),
    ));
  });
  return tasks;
}
