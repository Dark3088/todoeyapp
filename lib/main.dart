import 'package:flutter/material.dart';
import 'package:todoeyapp/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(
          onTaskSelected: (value) => setState(() {
            isChecked = value;
          }),
          isTaskSelected: isChecked,
        ));
  }
}
