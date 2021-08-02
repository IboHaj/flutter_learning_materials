import 'dart:math';

import 'package:bmi_calculator/bottomcontainer.dart';
import 'package:flutter/material.dart';
import 'reusablewidget.dart';
import 'reusablecard.dart';
import 'constants.dart';

int bmiValue;
String weightStatus = 'OVERWEIGHT';
String weightTips = 'WHY YOU FAT?';

class ResultsPage extends StatelessWidget {
  final int age;
  final int height;
  final int weight;

  double calculateBMI(int weight, int height) {
    return weight / pow((height * 0.01), 2);
  }

  ResultsPage({this.age, this.weight, this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'YOUR RESULT',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kInactiveBackgroundColor,
                childWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(
                        child: Text(
                      calculateBMI(weight, height).toString(),
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    )),
                    Center(
                      child: Text(weightStatus,
                          style: TextStyle(
                              fontSize: 46, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                          child: Text(weightTips,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold))),
                    ),
                  ],
                ),
              ),
            ),
            BottomContainer(onTap: () {}, containerText: 'RE-CALCULATE')
          ],
        ),
      ),
    );
  }
}
