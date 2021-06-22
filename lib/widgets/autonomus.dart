import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scores.dart';
import '../providers/game_type.dart';

class AutonomousScore extends StatefulWidget {
  @override
  _AutonomousScoreState createState() => _AutonomousScoreState();
}

class _AutonomousScoreState extends State<AutonomousScore> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);
    final gameType = Provider.of<GameType>(context);
    final navigationList = <Widget>[
      SizedBox(width: 13),
      Text('Navigation: '),
      Spacer(),
      Container(
          padding: EdgeInsets.only(right: 12),
          child: FlatButton(
            onPressed: () {
              setState(() {
                if (!scores.autoDetails.parkedRobot1)
                  scores.updateAutonomous(parkedRobot1: true);
                else
                  scores.updateAutonomous(parkedRobot1: false);
              });
              },
            child: Text('Parked'),
            color: scores.autoDetails.parkedRobot1
                ? Colors.green
                : Colors.grey,
          )
      ),
    ];

    if (gameType.traditional) {
      navigationList.add(
          Container(
              padding: EdgeInsets.only(right: 12),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (!scores.autoDetails.parkedRobot2)
                      scores.updateAutonomous(parkedRobot2: true);
                    else
                      scores.updateAutonomous(parkedRobot2: false);
                  });
                  },
                child: Text('Parked'),
                color: scores.autoDetails.parkedRobot2
                    ? Colors.green
                    : Colors.grey,
              )
          )
      );
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
        scores.updateAutonomous(parkedRobot2: false);
      }));
    }

    return Card(
        child: Column(
      children: [
        Text(
          'Autonomous',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.green,
          ),
        ),
        Row(
          children: navigationList,
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
                      scores.updateAutonomous(wobblesDelivered: val.round());
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
                    scores.updateAutonomous(powershotsKnocked: val.round());
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
                      scores.updateAutonomous(
                          lowGoal: scores.autoDetails.lowGoal - 1);
                    },
                  );
                }),
            Text(scores.autoDetails.lowGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomous(
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
                    scores.updateAutonomous(
                        midGoal: scores.autoDetails.midGoal - 1);
                  });
                }),
            Text(scores.autoDetails.midGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomous(
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
                    scores.updateAutonomous(
                        highGoal: scores.autoDetails.highGoal - 1);
                  });
                }),
            Text(scores.autoDetails.highGoal.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomous(
                        highGoal: scores.autoDetails.highGoal + 1);
                  });
                }),
          ],
        ),
      ],
    ));
  }
}
