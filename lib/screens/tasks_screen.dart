import 'package:flutter/material.dart';
import 'package:todoeyapp/models/task.dart';
import 'package:todoeyapp/screens/add_task_screen.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final _textController = TextEditingController();
  final taskManager = TaskManager();

  void createTask(String newTaskName) {
    setState(() {
      taskManager.createNewTask(taskText: newTaskName);
      _textController.clear();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void updateTask(int taskId) {
    setState(() {
      taskManager.updateTaskState(taskId);
    });
  }

  @override
  void initState() {
    super.initState();
    taskManager.initTasksList();
    _textController.addListener(() {
      _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(30),
                topEnd: Radius.circular(30),
              ),
            ),
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(
                  addTask: (String taskText) => createTask(taskText),
                  clearField: () => createTask,
                  textEditingController: _textController,
                )),
          );
        },
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 32,
              right: 32,
              bottom: 30,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(
                  Icons.list,
                  size: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Todoey',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                '${taskManager.getTaskList().length} Tasks',
                style: const TextStyle(
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
                taskList: taskManager.getTaskList(),
                updateCheckbox: (taskIndex) => updateTask(taskIndex),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
