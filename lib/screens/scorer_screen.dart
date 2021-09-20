import 'package:flutter/material.dart';
import '../widgets/autonomy.dart';
import '../widgets/endgame.dart';
import '../widgets/teleop.dart';
import '../widgets/total_scores.dart';

class ScorerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Freight Frenzy Scorer'),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            height: ((MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top)) *
                0.2,
            child: Scoreboard(),
          ),
          Container(
            height: ((MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top)) *
                0.8,
            child: ListView(
              children: [AutonomyCard(), TeleOpCard(), EndGameCard()],
            ),
          )
        ],
      ),
    );
  }
}
