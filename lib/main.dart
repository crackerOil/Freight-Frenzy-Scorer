import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './screens/scorer_screen.dart';
import './providers/scores.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) {
    runApp(MyApp());
  });
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FF Scorer',
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
            )
          ),
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
              )
            )
          )
        ),
        // darkTheme: ThemeData.dark(),
        home: ScorerScreen(),
        routes: {
          "/scorer_screen": (context) => ScorerScreen()
        },
      ),
    );
  }
}
