import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusablecard.dart';
import 'reusablewidget.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottomcontainer.dart';

enum GenderDecider { male, female }

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  GenderDecider selectedGender;
  int height = 176;
  int weight = 81;
  int age = 26;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BMI Calculator'),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Expanded(
                child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = GenderDecider.male;
                    });
                  },
                  color: selectedGender == GenderDecider.male
                      ? kActiveBackgroundColor
                      : kInactiveBackgroundColor,
                  childWidget: ReusableWidget(
                    icon: FontAwesomeIcons.mars,
                    gender: 'Male',
                  ),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = GenderDecider.female;
                  });
                },
                color: selectedGender == GenderDecider.female
                    ? kActiveBackgroundColor
                    : kInactiveBackgroundColor,
                childWidget: ReusableWidget(
                  icon: FontAwesomeIcons.venus,
                  gender: 'Female',
                ),
              )),
            ])),
            Expanded(
                child: ReusableCard(
              color: kActiveBackgroundColor,
              childWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text(
                    'Height',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' cm',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.pinkAccent,
                          thumbColor: Colors.pink,
                          inactiveTickMarkColor: Colors.grey,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15)),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        min: 0,
                        max: 250,
                        inactiveColor: Colors.blueGrey,
                        activeColor: Colors.pinkAccent,
                      ))
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveBackgroundColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(weight.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                iconButton: FontAwesomeIcons.plus),
                            SizedBox(
                              width: 15,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                iconButton: FontAwesomeIcons.minus)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveBackgroundColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(age.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                iconButton: FontAwesomeIcons.plus),
                            SizedBox(
                              width: 15,
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                iconButton: FontAwesomeIcons.minus)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottomContainer(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              age: age,
                              weight: weight,
                              height: height,
                            )));
              },
              containerText: 'CALCULATE',
            )
          ],
        )));
  }
}

class IconButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconButton;

  IconButton({@required this.onPressed, @required this.iconButton});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 12,
      child: Icon(iconButton),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey.shade700,
    );
  }
}
