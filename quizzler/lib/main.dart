import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questionbank.dart';

QuestionBank questionBank = QuestionBank();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quizlee'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10), child: QuizPage()),
      ),
    ));
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 200, 8, 0),
                      child: Text(
                        questionBank.text(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.green,
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          questionBank.canQuestion();
                          scoreKeeper.add(Icon(
                            Icons.check,
                            color: green,
                          ));
                        });
                      },
                      child:
                          Text('True', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            questionBank.canQuestion();
                          });
                        },
                        child: Text(
                          'False',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  color: Colors.red,
                ),
              ),
            ),
            Row(children: scoreKeeper)
          ],
        ),
      ),
    );
  }
}
