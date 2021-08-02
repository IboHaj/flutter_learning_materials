import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableWidget extends StatelessWidget {
  final String gender;
  final IconData icon;
  ReusableWidget({@required this.icon, @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Icon(
              icon,
              size: 80,
            )),
        Expanded(child: Text(gender))
      ],
    );
  }
}
