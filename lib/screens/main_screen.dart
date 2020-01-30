import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/side_panel.dart';
import '../widgets/logo.dart';

import '../providers/dares.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool quickAdd = true;
  @override
  Widget build(BuildContext context) {  
  String dareOfTheDay = 'A Test message about something funny you may or may not (but should) do.';
  String dareType = 'dare';
  String quickButtonText = 'Quick Add';
  

  _handleClick (dares) {
    dares.saveDare(dareOfTheDay, dareType);
    quickButtonText = 'Added!';
    print('Added');
    setState(() {
      quickAdd = false;
    });
    print(quickAdd);
  }
  
  final deviceSize = MediaQuery.of(context).size;
  final dares = Provider.of<Dares>(context);
    return Scaffold(
      appBar: AppBar(  
        
      ),
      drawer: SidePanel('main'),
      body: Container( 
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage("images/beer-gut.jpg"),
            fit: BoxFit.cover
          )
        ),
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
                ),
                color: Colors.white
              ),
              child: Center(
                child: Text(
                  dareOfTheDay,
                  style: TextStyle(  
                    fontSize: 17
                  ),
                )
              ),
              alignment: Alignment(0.0,0.0),
            ),
            SizedBox(height: 5,),
            RaisedButton( 
              child: Text(quickButtonText),
              onPressed: quickAdd ? () {_handleClick(dares);} : null
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