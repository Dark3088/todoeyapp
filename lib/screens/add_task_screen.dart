import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
    required this.addTask,
    required this.textEditingController,
  });

  final Function addTask;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        left: 32,
        right: 32,
      ),
      child: Column(
        children: [
          const Text('Add Task',
              style: TextStyle(fontSize: 32, color: Colors.lightBlueAccent)),
          const SizedBox(height: 10),
          Container(
            height: 38,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.lightBlueAccent, width: 3),
              ),
            ),
            child: TextFormField(
              cursorWidth: 3,
              autofocus: true,
              controller: textEditingController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                textEditingController.text = value;
                textEditingController.selection = TextSelection.collapsed(
                  offset: textEditingController.text.length,
                );
              },
              maxLines: 1,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 48,
            child: ElevatedButton(
              onPressed: () => addTask(textEditingController.text),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Colors.lightBlueAccent),
                textStyle: MaterialStateTextStyle.resolveWith(
                  (states) => const TextStyle(color: Colors.white),
                ),
              ),
              child: const Text('Add', style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
