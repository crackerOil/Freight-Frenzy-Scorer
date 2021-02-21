import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scores.dart';

class Scoreboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);
    return Card(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Autonomus',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
                Text(
                  scores.autoScore.toString(),
                  // autoData.toString(),
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'Tele-OP',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                  ),
                ),
                Text(
                  scores.teleopScore.toString(),
                  // teleopData.toString(),
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'EndGame',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
                Text(
                  scores.endgameScore.toString(),
                  // endgameData.toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
        Text(
          'Total Score: ${scores.totalScore}',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }
}
