import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  RoundButton({required this.x, required this.y, required this.onpressed});
  final Icon x;
  int y;
  final Function onpressed;
  @override
  _RoundButtonState createState() =>
      _RoundButtonState(x: x, y: y, onpressed: onpressed);
}

class _RoundButtonState extends State<RoundButton> {
  _RoundButtonState(
      {required this.x, required this.y, required this.onpressed});
  final Icon x;
  int y;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 5.0,
        onPressed: () => onpressed(),
        fillColor: Color(0xFF4C4F5E),
        highlightColor: Colors.redAccent,
        constraints: BoxConstraints.tightFor(width: 40, height: 40),
        shape: RoundedRectangleBorder(),
        child: x);
  }
}
