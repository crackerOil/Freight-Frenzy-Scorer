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
              Text('Ducks Delivered: '),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove, color: Colors.red),
                onPressed: () {
                  setState(() {
                    scores.updateEndgame(
                        ducksDelivered: scores.endgameDetails.ducksDelivered - 1);
                  });
                }
              ),
              Text(scores.endgameDetails.ducksDelivered.toString()),
              IconButton(
                icon: Icon(Icons.add, color: Colors.red),
                onPressed: () {
                  setState(() {
                    scores.updateEndgame(
                        ducksDelivered: scores.endgameDetails.ducksDelivered + 1);
                  });
                }
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Shipping Hub Balanced: '),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 12),
                child: TextButton(
                  child: Text(
                      (scores.endgameDetails.shippingHubBalanced) ? "Balanced" : "Unbalanced",
                      style : TextStyle(color: Colors.black)
                  ),
                  onPressed: () {
                    setState(() {
                      scores.updateEndgame(
                          shippingHubBalanced: !scores.endgameDetails.shippingHubBalanced);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (scores.endgameDetails.shippingHubBalanced) return Colors.red;
                      else return Colors.grey;
                    })
                  ),
                )
              ),
            ]
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Shared Hub Unbalanced: '),
              Spacer(),
              Container(
                padding: EdgeInsets.only(right: 12),
                child: TextButton(
                  child: Text(
                      (scores.endgameDetails.sharedHubUnbalanced) ? "Unbalanced" : "Balanced",
                      style : TextStyle(color: Colors.black)
                  ),
                  onPressed: () {
                    setState(() {
                      scores.updateEndgame(
                          sharedHubUnbalanced: !scores.endgameDetails.sharedHubUnbalanced);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (scores.endgameDetails.sharedHubUnbalanced) return Colors.red;
                      else return Colors.grey;
                    })
                  ),
                )
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
                padding: EdgeInsets.only(right: 12),
                child: Slider(
                  activeColor: Colors.red,
                  value: 1.0 * scores.endgameDetails.warehouseParking1.index,
                  onChanged: (val) {
                    setState(() {
                      scores.updateEndgame(warehouseParking1: Parking.values[val.round()]);
                    });
                  },
                  min: 0.0,
                  max: 2.0,
                  divisions: 2,
                  label: [
                    "Not Parked",
                    "Parked",
                    "Completely In"
                  ][scores.endgameDetails.warehouseParking1.index],
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
                  padding: EdgeInsets.only(right: 12),
                  child: Slider(
                    activeColor: Colors.red,
                    value: 1.0 * scores.endgameDetails.warehouseParking2.index,
                    onChanged: (val) {
                      setState(() {
                        scores.updateEndgame(warehouseParking2: Parking.values[val.round()]);
                      });
                    },
                    min: 0.0,
                    max: 2.0,
                    divisions: 2,
                    label: [
                      "Not Parked",
                      "Parked",
                      "Completely In"
                    ][scores.endgameDetails.warehouseParking2.index],
                  ),
                ),
              ]
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Capping: '),
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
                        setState(() {
                          scores.updateEndgame(
                              capping1: !scores.endgameDetails.capping1);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (scores.endgameDetails.capping1) return Colors.red;
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
                        setState(() {
                          scores.updateEndgame(
                              capping2: !scores.endgameDetails.capping2);
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (scores.endgameDetails.capping2) return Colors.red;
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
