import 'package:flutter/material.dart';

class DoneDunnaDone extends StatelessWidget {
  DoneDunnaDone({required this.symbol, required this.text});
  final IconData symbol;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        symbol,
        size: 80.0,
        color: Colors.white,
      ),
      SizedBox(height: 15.0),
      Text(text, style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98))),
    ]);
  }
}
