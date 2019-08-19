import 'package:flutter/material.dart';

import '../widgets/side_panel.dart';
import '../widgets/logo.dart';

class MainScreen extends StatelessWidget {
static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {  
  final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(  
        
      ),
      drawer: SidePanel('main'),
      body: Container( 
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BarjokerLogo(
              height: 100,
              size: 35,
            ),
            SizedBox(height: 30,),
            Container(
              width: deviceSize.width * .7,
              height: deviceSize.height * .25,
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(  
                border: Border.all(
                  width: 1
                )
              ),
              child: Center(
                child: Text(
                  'A Test message about something funny you may or may not (but should) do.',
                  style: TextStyle(  
                    fontSize: 17
                  ),
                )
              ),
              alignment: Alignment(0.0,0.0),
            ),
            SizedBox(height: 5,),
            RaisedButton( 
              child: Text('Quick Add'),
              onPressed: () {

              },
            ),
            Container( 
              height: deviceSize.height * .3,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton( 
                  child: Text('Version 0.1'),
                  onPressed: () {

                  },
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}