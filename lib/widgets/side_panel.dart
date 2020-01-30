import 'package:flutter/material.dart';

import '../screens/quick_game_screen.dart';
import '../screens/main_screen.dart';
import '../screens/customize_screen.dart';

class SidePanel extends StatelessWidget {
  final String current;

  SidePanel(this.current);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(  
        children: <Widget>[
          AppBar(  
            automaticallyImplyLeading: false,
          ),
          if(current != 'main')
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Main'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
              },
            ),
          if(current != 'main')
            Divider(),
          if(current != 'custom')
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Custom Game'),
              onTap: () {
                Navigator.of(context).pushNamed(QuickGameScreen.routeName);
              },
            ),
          if(current != 'custom')
            Divider(),
          if(current != 'quick')
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Quick Game'),
              onTap: () {
                Navigator.of(context).pushNamed(QuickGameScreen.routeName);
              },
            ),
          if(current != 'quick')
            Divider(),
          if(current != 'customize')
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Customize'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(CustomizeScreen.routeName);
              },
            ),
          if(current != 'customize')
            Divider(),
          if(current != 'settings')
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Settings'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(QuickGameScreen.routeName);
              },
          ),
        ],
      ),
    );
  }
}