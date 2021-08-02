import 'package:flutter/material.dart';
import 'constants.dart';

class BottomContainer extends StatelessWidget {
  final String containerText;
  final Function onTap;

  BottomContainer({@required this.onTap, @required this.containerText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            containerText,
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
