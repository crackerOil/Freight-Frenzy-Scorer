import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scores.dart';

class TeleOpCard extends StatefulWidget {
  @override
  _TeleOpCardState createState() => _TeleOpCardState();
}

class _TeleOpCardState extends State<TeleOpCard> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);

    return Card(
      child: Column(
        children: [
          Text(
            'Tele-Op',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Storage Unit: '),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        storageUnitFreight: scores.teleopDetails.storageUnitFreight - 1);
                  });
                }
              ),
              Text(scores.teleopDetails.storageUnitFreight.toString()),
              IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        storageUnitFreight: scores.teleopDetails.storageUnitFreight + 1);
                  });
                }
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Shipping Hub Level 1: '),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        level1Freight: scores.teleopDetails.level1Freight - 1);
                  });
                }
              ),
              Text(scores.teleopDetails.level1Freight.toString()),
              IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        level1Freight: scores.teleopDetails.level1Freight + 1);
                  });
                }
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Shipping Hub Level 2: '),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        level2Freight: scores.teleopDetails.level2Freight - 1);
                  });
                }
              ),
              Text(scores.teleopDetails.level2Freight.toString()),
              IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        level2Freight: scores.teleopDetails.level2Freight + 1);
                  });
                }
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Shipping Hub Level 3: '),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        level3Freight: scores.teleopDetails.level3Freight - 1);
                  });
                }
              ),
              Text(scores.teleopDetails.level3Freight.toString()),
              IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        level3Freight: scores.teleopDetails.level3Freight + 1);
                  });
                }
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 13),
              Text('Shared Hub: '),
              Spacer(),
              IconButton(
                icon: Icon(Icons.remove, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        sharedFreight: scores.teleopDetails.sharedFreight - 1);
                  });
                }
              ),
              Text(scores.teleopDetails.sharedFreight.toString()),
              IconButton(
                icon: Icon(Icons.add, color: Colors.orange),
                onPressed: () {
                  setState(() {
                    scores.updateTeleop(
                        sharedFreight: scores.teleopDetails.sharedFreight + 1);
                  });
                }
              ),
            ],
          ),
        ],
      )
    );
  }
}
