import 'package:flutter/material.dart';

import 'package:tossanddice/screens/dicescreen.dart';

void main() {
  runApp(const TossandDice());
}

class TossandDice extends StatelessWidget {
  const TossandDice({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceScreen(),
    );
  }
}
