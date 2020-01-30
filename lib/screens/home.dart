import 'package:flutter/material.dart';

import '../screens/quick_game_screen.dart';
import '../screens/main_screen.dart';

import '../widgets/logo.dart';

class HomeScreen extends StatelessWidget {
  @override

  Widget buttonContainer(BuildContext context) {
    return Column(
              children: <Widget>[
                RaisedButton( 
                  child: Text('Play Quick Game'),
                  onPressed: () {
                    Navigator.pushNamed(context, QuickGameScreen.routeName);
                  },
                ),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton( 
                      child: Text('Sign up'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, MainScreen.routeName);
                      },
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 2.0,
                      width: 1.0,
                    ),
                    FlatButton( 
                      child: Text('Sign up'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, MainScreen.routeName);
                      },
                    ),
                  ],
                )
                
              ],
            );
  }

  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // title: Text('Barjoker'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/beer-gut.jpg"),
            fit: BoxFit.cover
          )
        ),
        width: deviceSize.width,
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 50.0
              ),
              child: BarjokerLogo(
                height: 200,
                size: 50,
              )
            ),
            buttonContainer(context),
            Text('Why Premium?'),
            SizedBox(height: 10.0,)
          ],
        ),
      ),
    );
  }
}