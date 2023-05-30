import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'Reusable_card.dart';
import 'RoundButton.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

const bottomContainerheight = 80.0;
const xyz = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF11132B);
enum Gender { male, female, none }
int weight = 80;
int age = 20;

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.none;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                gender = Gender.male;
              });
            },
            child: ReusableCard(
              colour: gender == Gender.male ? xyz : inactiveCardColor,
              cardChild:
                  DoneDunnaDone(symbol: FontAwesomeIcons.mars, text: 'MALE'),
            ),
          )),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  gender = Gender.female;
                });
              },
              child: ReusableCard(
                  colour: gender == Gender.female ? xyz : inactiveCardColor,
                  cardChild: DoneDunnaDone(
                    symbol: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  )),
            ),
          )
        ])),
        Expanded(
            child: ReusableCard(
                colour: xyz,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900),
                          ),
                          Text('cm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.w900)),
                        ],
                      ),
                      Slider(
                          value: height.toDouble(),
                          min: 100.0,
                          max: 300.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          })
                    ]))),
        Expanded(
            child: Row(children: [
          Expanded(
            child: ReusableCard(
                colour: xyz,
                cardChild: Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text("Weight",
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98))),
                      Text(weight.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900)),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  x: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  y: 0,
                                  onpressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              RoundButton(
                                  x: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  y: 1,
                                  onpressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ]),
                      )
                    ]))),
          ),
          Expanded(
            child: ReusableCard(
                colour: xyz,
                cardChild: Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text("Age",
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xFF8D8E98))),
                      Text(age.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900)),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  x: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  y: 0,
                                  onpressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              RoundButton(
                                  x: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  y: 1,
                                  onpressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ]),
                      )
                    ]))),
          ),
        ])),
        GestureDetector(
          // Within the `FirstRoute` widget
          onTap: () {
            CalculatorBrain calc =
                CalculatorBrain(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Resultspage(
                        bmi: calc.calculateBmi(),
                        toptext: calc.topText(),
                        bottomtext: calc.bottomText(),
                      )),
            );
          },
          child: Container(
              child: Center(
                child: Text('CALCULATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900)),
              ),
              color: Color(0xFFEB1555),
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              height: bottomContainerheight),
        )
      ]),
    );
  }
}
