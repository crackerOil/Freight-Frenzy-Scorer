import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugscorer/widgets/endgame.dart';
import './providers/scores.dart';
import './widgets/total_scores.dart';
import './widgets/autonomus.dart';
import './widgets/teleop.dart';
import './widgets/endgame.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FinalScores(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Colors.blue.withBlue(147).withRed(29).withGreen(66),
            //primarySwatch: Colors.blue,
            accentColor: Colors.green,
            errorColor: Colors.red,
            fontFamily: 'QuickSand',
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                )),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                    )))),
        // darkTheme: ThemeData.dark(),
        home: MyHomePage(title: 'Ultimate Goal Scorer'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final scores = Provider.of<FinalScores>(context);
    final appBar = AppBar(
      title: Text(widget.title),
      actions: [
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
                MediaQuery.of(context).padding.top)) * 0.2,
            child: Scoreboard(),
          ),
          Container(
            height: ((MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top)) * 0.8,
            child: ListView(
              children: [
                AutonomusScore(),
                TeleOp(),
                EndGameCard()
              ],
            ),
          )
        ],
      ),
    );
  }
}
