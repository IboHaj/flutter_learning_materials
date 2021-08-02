import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_it/widgets/taskslist.dart';
import 'package:note_it/models/task.dart';
import 'package:note_it/screens/addtaskscreen.dart';
import 'package:provider/provider.dart';
import 'package:note_it/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return AddTaskScreen();
              });
        },
        backgroundColor: Colors.yellow.shade800,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.yellow.shade700,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 30, right: 30, bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 50,
                      ),
                      backgroundColor: Colors.yellow.shade800,
                    ),
                    Text(
                      'Note it!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      Provider.of<TaskData>(context).tasks.length > 0
                          ? '${Provider.of<TaskData>(context).tasks.length} tasks to be done'
                          : 'No tasks... Yet!',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ]),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TasksList(),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ))
          ],
        ),
      ),
    );
  }
}
