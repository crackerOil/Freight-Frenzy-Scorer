import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scores.dart';

class EndGameCard extends StatefulWidget {
  @override
  _EndGameCardState createState() => _EndGameCardState();
}

class _EndGameCardState extends State<EndGameCard> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);
    return Card(
        child: Column(
      children: [
        Text(
          'End Game',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.red,
          ),
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Wobble Goals Returned: '),
            Text(scores.endgameDetails.wobblesReturned.toString()),
            Spacer(),
            Container(
              width: 0.40 * MediaQuery.of(context).size.width,
              child: Slider(
                activeColor: Colors.red,
                value: 1.0 * scores.endgameDetails.wobblesReturned,
                onChanged: (val) {
                  setState(() {
                    scores.updateEndgame(wobblesReturned: val.round());
                  });
                },
                min: 0.0,
                max: 2.0,
                divisions: 2,
                label: scores.endgameDetails.wobblesReturned.toString(),
              ),
            )
          ],
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Wobble Goals in Drop Zone: '),
            Text(scores.endgameDetails.wobblesDropped.toString()),
            Spacer(),
            Container(
              width: 0.40 * MediaQuery.of(context).size.width,
              child: Slider(
                activeColor: Colors.red,
                value: 1.0 * scores.endgameDetails.wobblesDropped,
                onChanged: (val) {
                  setState(() {
                    scores.updateEndgame(wobblesDropped: val.round());
                  });
                },
                min: 0.0,
                max: 2.0,
                divisions: 2,
                label: scores.endgameDetails.wobblesDropped.toString(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Power Shots Knocked: '),
            Text(scores.endgameDetails.powershotsKnocked.toString()),
            Spacer(),
            Container(
              width: 0.40 * MediaQuery.of(context).size.width,
              child: Slider(
                activeColor: Colors.red,
                value: 1.0 * scores.endgameDetails.powershotsKnocked,
                onChanged: (val) {
                  setState(() {
                    scores.updateEndgame(powershotsKnocked: val.round());
                  });
                },
                min: 0.0,
                max: 3.0,
                divisions: 3,
                label: scores.endgameDetails.powershotsKnocked.toString(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 13),
            Text('Rings on Wobble Goal: '),
            Spacer(),
            IconButton(
                icon: Icon(Icons.remove, color: Colors.red),
                onPressed: () {
                  setState(() {
                    scores.updateEndgame(
                        ringsOnWobble: scores.endgameDetails.ringsOnWobble - 1);
                  });
                }),
            Text(scores.endgameDetails.ringsOnWobble.toString()),
            IconButton(
                icon: Icon(Icons.add, color: Colors.red),
                onPressed: () {
                  setState(() {
                    scores.updateEndgame(
                        ringsOnWobble: scores.endgameDetails.ringsOnWobble + 1);
                  });
                }),
          ],
        ),
      ],
    ));
  }
}
