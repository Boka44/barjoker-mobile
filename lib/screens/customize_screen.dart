import 'package:flutter/material.dart';

import '../widgets/side_panel.dart';
import '../widgets/logo.dart';

import '../screens/custom_list_screen.dart';

class CustomizeScreen extends StatelessWidget {
  static const String routeName = '/customize';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

      ),
      drawer: SidePanel('customize'),
      body: Container(  
        width: deviceSize.width,
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarjokerLogo( 
              height: 150,
              size: 35,
            ),
            Text( 
              'Customize',
              style: TextStyle(  
                fontSize: 25
              ),
            ),
            SizedBox(height: deviceSize.height * .1,),
            _buildButton('dare', context),
            _buildButton('success', context),
            _buildButton('punishment', context),
            
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String type, BuildContext context) {
    String capType = '${type[0].toUpperCase()}${type.substring(1)}';
    if(type == 'success') {
      capType += 'es';
    } else {
      capType += 's';
    }
    return Container(
      width: 180,
      child: RaisedButton(
        child: Text(
          capType,
          style: TextStyle(  
            fontSize: 20
          ),
        ),
        
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomListScreen(type)),
          );
        },
      ),
    );
  }
}