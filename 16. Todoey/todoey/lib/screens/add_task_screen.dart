import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  late String inputTask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        decoration: kCardBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 32,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
              ),
              onChanged: (value) {
                inputTask = value;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 48),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTodo(inputTask);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
