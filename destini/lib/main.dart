import 'package:flutter/material.dart';
import 'storybank.dart';

void main() => runApp(MyApp());
StoryBank storyBank = StoryBank();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Story(),
    );
  }
}

class Story extends StatefulWidget {
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                    child: Text(
                  storyBank.getStory(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBank.nextStory(1);
                      });
                    },
                    child: Text(
                      storyBank.getChoice1(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBank.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBank.getChoice2(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
