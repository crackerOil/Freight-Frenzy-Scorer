import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scores.dart';

class TeleOp extends StatefulWidget {
  @override
  _TeleOpState createState() => _TeleOpState();
}

class _TeleOpState extends State<TeleOp> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);
    return Card(
        child: Column(
      children: [
        Text(
          'Tele-Op',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.orange,
          ),
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Low Goal: '),
            Spacer(),
            IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        lowGoal: scores.teleopDetails.lowGoal - 1);
                  });
                }),
            Text(scores.teleopDetails.lowGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        lowGoal: scores.teleopDetails.lowGoal + 1);
                  });
                }),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Mid Goal: '),
            Spacer(),
            IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        midGoal: scores.teleopDetails.midGoal - 1);
                  });
                }),
            Text(scores.teleopDetails.midGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        midGoal: scores.teleopDetails.midGoal + 1);
                  });
                }),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('High Goal: '),
            Spacer(),
            IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        highGoal: scores.teleopDetails.highGoal - 1);
                  });
                }),
            Text(scores.teleopDetails.highGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        highGoal: scores.teleopDetails.highGoal + 1);
                  });
                }),
          ],
        ),
      ],
    ));
  }
}
