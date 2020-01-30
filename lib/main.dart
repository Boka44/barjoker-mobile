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
          primaryColor: Colors.black
          // primarySwatch: Colors.grey
        ),
        home: HomeScreen(),
        routes: {
          QuickGameScreen.routeName: (ctx) => QuickGameScreen('quick'),
          QuickGameScreen.routeNameCustom: (ctx) => QuickGameScreen('custom'),
          MainScreen.routeName: (ctx) => MainScreen(),
          CustomizeScreen.routeName: (ctx) => CustomizeScreen()
        },
      )
    );
  }
}