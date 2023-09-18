import 'package:flutter/material.dart';
import 'dart:math';

class LudoBoard extends StatefulWidget {
  @override
  _LudoBoardState createState() => _LudoBoardState();
}

class _LudoBoardState extends State<LudoBoard> {
  int playerTurn = 1; // Player 1 starts
  int diceValue = 1;

  void rollDice() {
    setState(() {
      diceValue = Random().nextInt(6) + 1;
      // Add logic for moving player pieces here
      // Change playerTurn as per your game rules
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Player $playerTurn\'s Turn',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.0),
        Text(
          'Dice Value: $diceValue',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LudoPiece(player: 1),
            LudoPiece(player: 2),
          ],
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: rollDice,
          child: Text('Roll Dice'),
        ),
      ],
    );
  }
}

class LudoPiece extends StatelessWidget {
  final int player;

  LudoPiece({required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: player == 1 ? Colors.red : Colors.green,
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}
