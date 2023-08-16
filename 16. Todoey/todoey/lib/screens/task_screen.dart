import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widget/tasks_list.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.list,
                        size: 48,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Todoey',
                    style: kAppTitleTextStyle,
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).todoCount} Tasks',
                    style: kAppSubTitleTextStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: kCardBoxDecoration,
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
