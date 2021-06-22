import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Autonomous {
  int wobblesDelivered;
  int powershotsKnocked;
  int lowGoal;
  int midGoal;
  int highGoal;
  bool parkedRobot1;
  bool parkedRobot2;
  bool traditional;

  Autonomous({
    @required this.highGoal,
    @required this.lowGoal,
    @required this.midGoal,
    @required this.parkedRobot1,
    @required this.parkedRobot2,
    @required this.powershotsKnocked,
    @required this.wobblesDelivered,
  });
}

class Teleop {
  int lowGoal;
  int midGoal;
  int highGoal;

  Teleop({
    @required this.highGoal,
    @required this.midGoal,
    @required this.lowGoal,
  });
}

class EndGame {
  int wobblesReturned;
  int wobblesDropped;
  int powershotsKnocked;
  int ringsOnWobble;

  EndGame({@required this.powershotsKnocked,
    @required this.ringsOnWobble,
    @required this.wobblesDropped,
    @required this.wobblesReturned});
}

class FinalScores with ChangeNotifier {
  Autonomous _autoScore ;
  Teleop _teleopScore ;
  EndGame _endgameScore;
  FinalScores({Autonomous autonomous, Teleop teleop, EndGame endGame}) {
    _autoScore = autonomous ?? Autonomous(highGoal: 0, lowGoal: 0, midGoal: 0, parkedRobot1: false, parkedRobot2: false, powershotsKnocked: 0, wobblesDelivered: 0);
    _teleopScore = teleop ?? Teleop(highGoal: 0, midGoal: 0, lowGoal: 0);
    _endgameScore = endGame ?? EndGame(powershotsKnocked: 0, ringsOnWobble: 0, wobblesDropped: 0, wobblesReturned: 0);
  }
  Autonomous get autoDetails => _autoScore;
  Teleop get teleopDetails => _teleopScore;
  EndGame get endgameDetails => _endgameScore;
  int get autoScore {
    return 15 * _autoScore.wobblesDelivered +
        5 * (_autoScore.parkedRobot1 ? 1 : 0) +
        5 * (_autoScore.parkedRobot2 ? 1 : 0) +
        3 * _autoScore.lowGoal +
        6 * _autoScore.midGoal +
        12 * _autoScore.highGoal +
        15 * _autoScore.powershotsKnocked;
  }

  int get teleopScore {
    return 2 * _teleopScore.lowGoal +
        4 * _teleopScore.midGoal +
        6 * _teleopScore.highGoal;
  }

  int get endgameScore {
    return 5 * _endgameScore.wobblesReturned +
        20 * _endgameScore.wobblesDropped +
        15 * _endgameScore.powershotsKnocked + 5 * _endgameScore.ringsOnWobble;
  }

  int get totalScore => autoScore + teleopScore + endgameScore;

  void updateAutonomous({int wobblesDelivered =-1, int powershotsKnocked=-1, int lowGoal=-1, int midGoal=-1, int highGoal=-1, bool parkedRobot1, bool parkedRobot2}) {
    if(wobblesDelivered !=-1 && wobblesDelivered <= 2)
      _autoScore.wobblesDelivered = wobblesDelivered;
    if(powershotsKnocked !=-1 && powershotsKnocked <=3)
      _autoScore.powershotsKnocked = powershotsKnocked;
    if(lowGoal !=-1)
      _autoScore.lowGoal = lowGoal;
    if(midGoal !=-1)
      _autoScore.midGoal = midGoal;
    if(highGoal !=-1)
      _autoScore.highGoal = highGoal;
    if(parkedRobot1 != null)
      _autoScore.parkedRobot1 = parkedRobot1;
    if(parkedRobot2 != null)
      _autoScore.parkedRobot2 = parkedRobot2;
    notifyListeners();
  }

  void updateTeleop({int lowGoal=-1, int midGoal=-1, int highGoal=-1}) {
    if(lowGoal !=-1)
      _teleopScore.lowGoal = lowGoal;
    if(midGoal !=-1)
      _teleopScore.midGoal = midGoal;
    if(highGoal !=-1)
      _teleopScore.highGoal = highGoal;
    notifyListeners();
  }

  void updateEndgame({int powershotsKnocked=-1, int wobblesReturned=-1, int wobblesDropped=-1, int ringsOnWobble=-1}) {
    if(powershotsKnocked !=-1)
      _endgameScore.powershotsKnocked = powershotsKnocked;
    if(wobblesReturned !=-1)
      _endgameScore.wobblesReturned = wobblesReturned;
    if(wobblesDropped !=-1)
      _endgameScore.wobblesDropped = wobblesDropped;
    if(ringsOnWobble !=-1)
      _endgameScore.ringsOnWobble = ringsOnWobble;
    notifyListeners();
  }

  void resetScore () {
    _autoScore = Autonomous(highGoal: 0, lowGoal: 0, midGoal: 0, parkedRobot1: false, parkedRobot2: false, powershotsKnocked: 0, wobblesDelivered: 0);
    _teleopScore = Teleop(highGoal: 0, midGoal: 0, lowGoal: 0);
    _endgameScore = EndGame(powershotsKnocked: 0, ringsOnWobble: 0, wobblesDropped: 0, wobblesReturned: 0);
    notifyListeners();
  }
}
