import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widget/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, todoData, child) {
        return ListView.builder(
          itemCount: todoData.todoCount,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var todo = todoData.todoList[index];
            return TaskTile(
              taskTitle: todo.name,
              isChecked: todo.isDone,
              checkboxCallback: (checkboxState) {
                todoData.updateTask(todo);
              },
              longPressCallback: () {
                todoData.deleteTask(index);
              },
            );
          },
        );
      },
    );
  }
}
