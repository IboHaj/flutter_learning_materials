import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function checkBoxCallback;

  TaskWidget({this.isChecked, this.title, this.checkBoxCallback});

  // void checkBoxCallBack(bool checkBoxState) {
  //   setState(() {
  //     isChecked = checkBoxState;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          title,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.yellow.shade700,
          value: isChecked,
          onChanged: checkBoxCallback,
        ));
  }
}
