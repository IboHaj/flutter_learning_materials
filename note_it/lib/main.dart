import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_it/screens/taskscreen.dart';
import 'package:note_it/models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
