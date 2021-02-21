import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scores.dart';

class AutonomusScore extends StatefulWidget {
  @override
  _AutonomusScoreState createState() => _AutonomusScoreState();
}

class _AutonomusScoreState extends State<AutonomusScore> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);
    return Card(
        child: Column(
      children: [
        Text(
          'Autonomus',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.green,
          ),
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Navigation: '),
            Spacer(),
            Container(
                padding: EdgeInsets.only(right: 12),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (scores.autoDetails.parkedRobots == 0)
                        scores.updateAutonomus(parkedRobots: 1);
                      else
                        scores.updateAutonomus(parkedRobots: 0);
                    });
                  },
                  child: Text('Parked'),
                  color: scores.autoDetails.parkedRobots == 1
                      ? Colors.green
                      : Colors.grey,
                ))
          ],
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Wobble Goals Delivered: '),
            Text(scores.autoDetails.wobblesDelivered.toString()),
            Spacer(),
            Container(
                width: 0.40 * MediaQuery.of(context).size.width,
                child: Slider(
                  activeColor: Colors.green,
                  value: 1.0 * scores.autoDetails.wobblesDelivered,
                  onChanged: (val) {
                    setState(() {
                      scores.updateAutonomus(wobblesDelivered: val.round());
                    });
                  },
                  min: 0.0,
                  max: 2.0,
                  divisions: 2,
                  label: scores.autoDetails.wobblesDelivered.toString(),
                )),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Power Shots Knocked: '),
            Text(scores.autoDetails.powershotsKnocked.toString()),
            Spacer(),
            Container(
              width: 0.40 * MediaQuery.of(context).size.width,
              child: Slider(
                activeColor: Colors.green,
                value: 1.0 * scores.autoDetails.powershotsKnocked,
                onChanged: (val) {
                  setState(() {
                    scores.updateAutonomus(powershotsKnocked: val.round());
                  });
                },
                min: 0.0,
                max: 3.0,
                divisions: 3,
                label: scores.autoDetails.powershotsKnocked.toString(),
              ),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Low Goal: '),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.green,
                ),
                onPressed: () {
                  setState(
                    () {
                      scores.updateAutonomus(
                          lowGoal: scores.autoDetails.lowGoal - 1);
                    },
                  );
                }),
            Text(scores.autoDetails.lowGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomus(
                        lowGoal: scores.autoDetails.lowGoal + 1);
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
                icon: Icon(Icons.remove, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomus(
                        midGoal: scores.autoDetails.midGoal - 1);
                  });
                }),
            Text(scores.autoDetails.midGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomus(
                        midGoal: scores.autoDetails.midGoal + 1);
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
                icon: Icon(Icons.remove, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomus(
                        highGoal: scores.autoDetails.highGoal - 1);
                  });
                }),
            Text(scores.autoDetails.highGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomus(
                        highGoal: scores.autoDetails.highGoal + 1);
                  });
                }),
          ],
        ),
      ],
    ));
  }
}
