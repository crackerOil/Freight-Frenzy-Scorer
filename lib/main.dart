import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ugscorer/screens/scorer_screen.dart';
import './providers/scores.dart';
import './providers/game_type.dart';
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
        ),
        ChangeNotifierProvider(
          create: (_) => GameType(),
        ),
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
        home: ScorerScreen(),
        routes: {
          ScorerScreen.routeName: (ctx) => ScorerScreen()
        },
      ),
    );
  }
}
