import 'package:bmi/Reusable_card.dart';
import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Resultspage extends StatelessWidget {
  Resultspage(
      {required this.bmi, required this.toptext, required this.bottomtext});
  final String bmi;
  final String toptext;
  final String bottomtext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI CAlCULATOR'))),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Your Result",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900)),
            SizedBox(height: 15.0),
            Expanded(
                child: ReusableCard(
                    colour: xyz,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          toptext.toUpperCase(),
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(bmi,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 90.0,
                                fontWeight: FontWeight.w900)),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(bottomtext,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500)),
                      ],
                    ))),
            GestureDetector(
              // Within the `FirstRoute` widget
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              child: Container(
                  child: Center(
                    child: Text('RE-CALCULATE',
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
