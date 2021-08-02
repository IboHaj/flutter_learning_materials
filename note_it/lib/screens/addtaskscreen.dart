import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_it/models/task.dart';
import 'package:provider/provider.dart';
import 'package:note_it/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
        color: Colors.grey.shade600,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Add a note or a task',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.yellow.shade700),
              ),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
              ),
              TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context).addTask(newTaskTitle);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 130),
                    color: Colors.yellow.shade900,
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.yellow.shade700, fontSize: 28),
                    ),
                  ))
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
        ));
  }
}
