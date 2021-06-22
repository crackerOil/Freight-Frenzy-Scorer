import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameType with ChangeNotifier {
  bool traditional = false;

  void updateGameType() {
    traditional = !traditional;
    notifyListeners();
  }
}
