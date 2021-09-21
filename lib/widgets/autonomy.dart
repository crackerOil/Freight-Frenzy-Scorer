import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scores.dart';

class AutonomyCard extends StatefulWidget {
  @override
  _AutonomyCardState createState() => _AutonomyCardState();
}

class _AutonomyCardState extends State<AutonomyCard> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);

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
            children: [
              SizedBox(width: 13),
              Text('Duck Delivered: '),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    IconButton(
                      // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                      icon: (scores.autoDetails.duckDelivered)
                          ? Image.asset('assets/ducks/yellow_duck.png')
                          : Image.asset('assets/ducks/grey_duck.png'),
                      onPressed: () {
                        setState(() {
                          scores.updateAutonomous(duckDelivered: !scores.autoDetails.duckDelivered);
                        });
                      },
                    ),
                  ],
                )
              ),
            ]
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Storage Unit Parking 1: '),
              // Text([
              //   "Not Parked",
              //   "Parked",
              //   "Completely In"
              // ][scores.autoDetails.storageUnitParking1.index]),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 6),
                child: Slider(
                  activeColor: Colors.green,
                  value: 1.0 * scores.autoDetails.storageUnitParking1.index,
                  onChanged: (val) {
                    setState(() {
                      scores.updateAutonomous(storageUnitParking1: Parking.values[val.round()]);
                    });
                  },
                  min: 0.0,
                  max: 2.0,
                  divisions: 2,
                  label: [
                    "Not Parked",
                    "Parked",
                    "Completely In"
                  ][scores.autoDetails.storageUnitParking1.index],
                ),
              ),
            ]
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Storage Unit Parking 2: '),
              // Text([
              //   "Not Parked",
              //   "Parked",
              //   "Completely In"
              // ][scores.autoDetails.storageUnitParking2.index]),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 6),
                child: Slider(
                  activeColor: Colors.green,
                  value: 1.0 * scores.autoDetails.storageUnitParking2.index,
                  onChanged: (val) {
                    setState(() {
                      scores.updateAutonomous(storageUnitParking2: Parking.values[val.round()]);
                    });
                  },
                  min: 0.0,
                  max: 2.0,
                  divisions: 2,
                  label: [
                    "Not Parked",
                    "Parked",
                    "Completely In"
                  ][scores.autoDetails.storageUnitParking2.index],
                ),
              ),
            ]
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Warehouse Parking 1: '),
              // Text([
              //   "Not Parked",
              //   "Parked",
              //   "Completely In"
              // ][scores.autoDetails.warehouseParking1.index]),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 6),
                child: Slider(
                  activeColor: Colors.green,
                  value: 1.0 * scores.autoDetails.warehouseParking1.index,
                  onChanged: (val) {
                    setState(() {
                      scores.updateAutonomous(warehouseParking1: Parking.values[val.round()]);
                    });
                  },
                  min: 0.0,
                  max: 2.0,
                  divisions: 2,
                  label: [
                    "Not Parked",
                    "Parked",
                    "Completely In"
                  ][scores.autoDetails.warehouseParking1.index],
                ),
              ),
            ]
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Warehouse Parking 2: '),
              // Text([
              //   "Not Parked",
              //   "Parked",
              //   "Completely In"
              // ][scores.autoDetails.warehouseParking2.index]),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 6),
                child: Slider(
                  activeColor: Colors.green,
                  value: 1.0 * scores.autoDetails.warehouseParking2.index,
                  onChanged: (val) {
                    setState(() {
                      scores.updateAutonomous(warehouseParking2: Parking.values[val.round()]);
                    });
                  },
                  min: 0.0,
                  max: 2.0,
                  divisions: 2,
                  label: [
                    "Not Parked",
                    "Parked",
                    "Completely In"
                  ][scores.autoDetails.warehouseParking2.index],
                ),
              ),
            ]
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Storage Unit Freight: '),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomous(
                        storageUnitFreight: scores.autoDetails.storageUnitFreight - 1);
                  });
                }
              ),
              Text(scores.autoDetails.storageUnitFreight.toString()),
              IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomous(
                        storageUnitFreight: scores.autoDetails.storageUnitFreight + 1);
                  });
                }
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Shipping Hub Freight: '),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomous(
                        shippingHubFreight: scores.autoDetails.shippingHubFreight - 1);
                  });
                }
              ),
              Text(scores.autoDetails.shippingHubFreight.toString()),
              IconButton(
                icon: Icon(Icons.add, color: Colors.green),
                onPressed: () {
                  setState(() {
                    scores.updateAutonomous(
                        shippingHubFreight: scores.autoDetails.shippingHubFreight + 1);
                  });
                }
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Duck Bonus: '),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    TextButton(
                      child: Text(
                          "Robot 1",
                          style : TextStyle(color: Colors.black)
                      ),
                      onPressed: () {
                        if (!scores.autoDetails.shippingElementBonus1) {
                          setState(() {
                            scores.updateAutonomous(duckBonus1: !scores.autoDetails.duckBonus1);
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (scores.autoDetails.duckBonus1) return Colors.green;
                          else return Colors.grey;
                        })
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      child: Text(
                          "Robot 2",
                          style : TextStyle(color: Colors.black)
                      ),
                      onPressed: () {
                        if (!scores.autoDetails.shippingElementBonus2) {
                          setState(() {
                            scores.updateAutonomous(duckBonus2: !scores.autoDetails.duckBonus2);
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (scores.autoDetails.duckBonus2) return Colors.green;
                          else return Colors.grey;
                        })
                      ),
                    ),
                  ],
                )
              ),
            ]
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Shipping Element Bonus: '),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    TextButton(
                      child: Text(
                        "Robot 1",
                        style : TextStyle(color: Colors.black)
                      ),
                      onPressed: () {
                        if (!scores.autoDetails.duckBonus1) {
                          setState(() {
                            scores.updateAutonomous(
                                shippingElementBonus1: !scores.autoDetails.shippingElementBonus1);
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (scores.autoDetails.shippingElementBonus1) return Colors.green;
                          else return Colors.grey;
                        })
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      child: Text(
                          "Robot 2",
                          style : TextStyle(color: Colors.black)
                      ),
                      onPressed: () {
                        if (!scores.autoDetails.duckBonus2) {
                          setState(() {
                            scores.updateAutonomous(
                                shippingElementBonus2: !scores.autoDetails.shippingElementBonus2);
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (scores.autoDetails.shippingElementBonus2) return Colors.green;
                          else return Colors.grey;
                        })
                      ),
                    ),
                  ],
                )
              ),
            ]
          ),
        ],
      )
    );
  }
}
