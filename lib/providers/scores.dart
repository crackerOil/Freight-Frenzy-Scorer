import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Parking {
  NOT_PARKED,
  IN,
  COMPLETELY_IN
}

class Autonomous {
  bool duckDelivered;
  Parking storageUnitParking1;
  Parking storageUnitParking2;
  Parking warehouseParking1;
  Parking warehouseParking2;
  int storageUnitFreight;
  int shippingHubFreight;
  bool duckBonus1;
  bool duckBonus2;
  bool shippingElementBonus1;
  bool shippingElementBonus2;

  Autonomous({
    required this.duckDelivered,
    required this.storageUnitParking1,
    required this.storageUnitParking2,
    required this.warehouseParking1,
    required this.warehouseParking2,
    required this.storageUnitFreight,
    required this.shippingHubFreight,
    required this.duckBonus1,
    required this.duckBonus2,
    required this.shippingElementBonus1,
    required this.shippingElementBonus2,
  });
}

class Teleop {
  int storageUnitFreight;
  int level1Freight;
  int level2Freight;
  int level3Freight;
  int sharedFreight;

  Teleop({
    required this.storageUnitFreight,
    required this.level1Freight,
    required this.level2Freight,
    required this.level3Freight,
    required this.sharedFreight,
  });
}

class EndGame {
  int ducksDelivered;
  bool shippingHubBalanced;
  bool sharedHubUnbalanced;
  Parking warehouseParking1;
  Parking warehouseParking2;
  bool capping1;
  bool capping2;

  EndGame({
    required this.ducksDelivered,
    required this.shippingHubBalanced,
    required this.sharedHubUnbalanced,
    required this.warehouseParking1,
    required this.warehouseParking2,
    required this.capping1,
    required this.capping2
  });
}

class FinalScores with ChangeNotifier {
  late Autonomous _autoScore;
  late Teleop _teleopScore;
  late EndGame _endgameScore;

  FinalScores() {
    _autoScore = Autonomous(
        duckDelivered: false,
        storageUnitParking1: Parking.NOT_PARKED,
        storageUnitParking2: Parking.NOT_PARKED,
        warehouseParking1: Parking.NOT_PARKED,
        warehouseParking2: Parking.NOT_PARKED,
        storageUnitFreight: 0,
        shippingHubFreight: 0,
        duckBonus1: false,
        duckBonus2: false,
        shippingElementBonus1: false,
        shippingElementBonus2: false
    );
    _teleopScore = Teleop(
        storageUnitFreight: 0,
        level1Freight: 0,
        level2Freight: 0,
        level3Freight: 0,
        sharedFreight: 0
    );
    _endgameScore = EndGame(
        ducksDelivered: 0,
        shippingHubBalanced: false,
        sharedHubUnbalanced: false,
        warehouseParking1: Parking.NOT_PARKED,
        warehouseParking2: Parking.NOT_PARKED,
        capping1: false,
        capping2: false
    );
  }

  Autonomous get autoDetails => _autoScore;
  Teleop get teleopDetails => _teleopScore;
  EndGame get endgameDetails => _endgameScore;

  int get autoScore {
    return (_autoScore.duckDelivered ? 10 : 0)
        + (_autoScore.storageUnitParking1.index * 3)
        + (_autoScore.storageUnitParking2.index * 3)
        + (_autoScore.warehouseParking1.index * 5)
        + (_autoScore.warehouseParking2.index * 5)
        + (_autoScore.storageUnitFreight * 2)
        + (_autoScore.shippingHubFreight * 6)
        + (_autoScore.duckBonus1 ? 10 : 0)
        + (_autoScore.duckBonus2 ? 10 : 0)
        + (_autoScore.shippingElementBonus1 ? 20 : 0)
        + (_autoScore.shippingElementBonus2 ? 20 : 0);
  }

  int get teleopScore {
    return (_teleopScore.storageUnitFreight)
        + (_teleopScore.level1Freight * 2)
        + (_teleopScore.level2Freight * 4)
        + (_teleopScore.level3Freight * 6)
        + (_teleopScore.sharedFreight * 4);
  }

  int get endgameScore {
    return (_endgameScore.ducksDelivered * 6)
        + (_endgameScore.shippingHubBalanced ? 10 : 0)
        + (_endgameScore.sharedHubUnbalanced ? 20 : 0)
        + (_endgameScore.warehouseParking1.index * 3)
        + (_endgameScore.warehouseParking2.index * 3)
        + (_endgameScore.capping1 ? 15 : 0)
        + (_endgameScore.capping2 ? 15 : 0);
  }

  int get totalScore => autoScore + teleopScore + endgameScore;

  void updateAutonomous({
    bool? duckDelivered,
    Parking? storageUnitParking1,
    Parking? storageUnitParking2,
    Parking? warehouseParking1,
    Parking? warehouseParking2,
    int? storageUnitFreight,
    int? shippingHubFreight,
    bool? duckBonus1,
    bool? duckBonus2,
    bool? shippingElementBonus1,
    bool? shippingElementBonus2
  }) {
    _autoScore.duckDelivered = duckDelivered ?? _autoScore.duckDelivered;
    _autoScore.storageUnitParking1 = storageUnitParking1 ?? _autoScore.storageUnitParking1;
    _autoScore.storageUnitParking2 = storageUnitParking2 ?? _autoScore.storageUnitParking2;
    _autoScore.warehouseParking1 = warehouseParking1 ?? _autoScore.warehouseParking1;
    _autoScore.warehouseParking2 = warehouseParking2 ?? _autoScore.warehouseParking2;
    _autoScore.storageUnitFreight = (storageUnitFreight != null && storageUnitFreight > -1)
        ? storageUnitFreight
        :_autoScore.storageUnitFreight;
    _autoScore.shippingHubFreight = (shippingHubFreight != null && shippingHubFreight > -1)
        ? shippingHubFreight
        : _autoScore.shippingHubFreight;
    _autoScore.duckBonus1 = duckBonus1 ?? _autoScore.duckBonus1;
    _autoScore.duckBonus2 = duckBonus2 ?? _autoScore.duckBonus2;
    _autoScore.shippingElementBonus1 = shippingElementBonus1 ?? _autoScore.shippingElementBonus1;
    _autoScore.shippingElementBonus2 = shippingElementBonus2 ?? _autoScore.shippingElementBonus2;

    notifyListeners();
  }

  void updateTeleop({
    int? storageUnitFreight,
    int? level1Freight,
    int? level2Freight,
    int? level3Freight,
    int? sharedFreight
  }) {
    _teleopScore.storageUnitFreight = (storageUnitFreight != null && storageUnitFreight > -1)
        ? storageUnitFreight
        :_teleopScore.storageUnitFreight;
    _teleopScore.level1Freight = (level1Freight != null && level1Freight > -1)
        ? level1Freight
        :_teleopScore.level1Freight;
    _teleopScore.level2Freight = (level2Freight != null && level2Freight > -1)
        ? level2Freight
        :_teleopScore.level2Freight;
    _teleopScore.level3Freight = (level3Freight != null && level3Freight > -1)
        ? level3Freight
        :_teleopScore.level3Freight;
    _teleopScore.sharedFreight = (sharedFreight != null && sharedFreight > -1)
        ? sharedFreight
        :_teleopScore.sharedFreight;

    notifyListeners();
  }

  void updateEndgame({
    int? ducksDelivered,
    bool? shippingHubBalanced,
    bool? sharedHubUnbalanced,
    Parking? warehouseParking1,
    Parking? warehouseParking2,
    bool? capping1,
    bool? capping2
  }) {
    _endgameScore.ducksDelivered = (ducksDelivered != null && ducksDelivered > -1)
        ? ducksDelivered
        :_endgameScore.ducksDelivered;
    _endgameScore.shippingHubBalanced = shippingHubBalanced ?? _endgameScore.shippingHubBalanced;
    _endgameScore.sharedHubUnbalanced = sharedHubUnbalanced ?? _endgameScore.sharedHubUnbalanced;
    _endgameScore.warehouseParking1 = warehouseParking1 ?? _endgameScore.warehouseParking1;
    _endgameScore.warehouseParking2 = warehouseParking2 ?? _endgameScore.warehouseParking2;
    _endgameScore.capping1 = capping1 ?? _endgameScore.capping1;
    _endgameScore.capping2 = capping2 ?? _endgameScore.capping2;

    notifyListeners();
  }

  void resetScore () {
    _autoScore = Autonomous(
        duckDelivered: false,
        storageUnitParking1: Parking.NOT_PARKED,
        storageUnitParking2: Parking.NOT_PARKED,
        warehouseParking1: Parking.NOT_PARKED,
        warehouseParking2: Parking.NOT_PARKED,
        storageUnitFreight: 0,
        shippingHubFreight: 0,
        duckBonus1: false,
        duckBonus2: false,
        shippingElementBonus1: false,
        shippingElementBonus2: false
    );
    _teleopScore = Teleop(
        storageUnitFreight: 0,
        level1Freight: 0,
        level2Freight: 0,
        level3Freight: 0,
        sharedFreight: 0
    );
    _endgameScore = EndGame(
        ducksDelivered: 0,
        shippingHubBalanced: false,
        sharedHubUnbalanced: false,
        warehouseParking1: Parking.NOT_PARKED,
        warehouseParking2: Parking.NOT_PARKED,
        capping1: false,
        capping2: false
    );

    notifyListeners();
  }
}
