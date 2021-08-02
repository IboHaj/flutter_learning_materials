import 'package:flutter/material.dart';
import 'taskwidget.dart';
import 'package:provider/provider.dart';
import 'package:note_it/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskWidget(
              title: task.name,
              isChecked: task.isDone,
              checkBoxCallback: (checkBoxState) {
                taskData.updateTask(task);
              });
        },
        itemCount: taskData.tasks.length,
      );
    });
  }
}
