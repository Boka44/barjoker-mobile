import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';
import './screens/quick_game_screen.dart';
import './screens/main_screen.dart';
import './screens/customize_screen.dart';

import './providers/dares.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Dares(),
        ),
      ],
      child: MaterialApp(
        title: "Barjoker",
        theme: ThemeData(
          primarySwatch: Colors.deepOrange
        ),
        home: HomeScreen(),
        routes: {
          QuickGameScreen.routeName: (ctx) => QuickGameScreen(),
          MainScreen.routeName: (ctx) => MainScreen(),
          CustomizeScreen.routeName: (ctx) => CustomizeScreen()
        },
      )
    );
  }
}