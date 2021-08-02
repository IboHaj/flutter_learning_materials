import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BallPageState();
  }
}

class BallPageState extends StatefulWidget {
  @override
  _BallPageStateState createState() => _BallPageStateState();
}

class _BallPageStateState extends State<BallPageState> {
  int ballImage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ask me anything mortal',
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade500,
        ),
        body: Container(
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      ballImage = Random().nextInt(4) + 1;
                    });
                  },
                  child: Expanded(
                    child: Image.asset('images/ball$ballImage.png'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
