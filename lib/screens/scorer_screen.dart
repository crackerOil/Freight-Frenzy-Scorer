import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugscorer/providers/scores.dart';
import 'package:ugscorer/providers/game_type.dart';
import 'package:ugscorer/widgets/autonomus.dart';
import 'package:ugscorer/widgets/endgame.dart';
import 'package:ugscorer/widgets/teleop.dart';
import 'package:ugscorer/widgets/total_scores.dart';

class ScorerScreen extends StatelessWidget {
  static const routeName = '/scorer-screen';

  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);
    final gameType = Provider.of<GameType>(context);
    final appBar = AppBar(
      title: Text('Ultimate Goal Scorer'),
      actions: [
        IconButton(icon: gameType.traditional 
	  ? Icon(Icons.looks_two_outlined)
	  : Icon(Icons.looks_one_outlined), 
	  onPressed: gameType.updateGameType),
        IconButton(icon: Icon(Icons.refresh), onPressed: scores.resetScore)
      ],
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
              children: [AutonomousScore(), TeleOp(), EndGameCard()],
            ),
          )
        ],
      ),
    );
  }
}
