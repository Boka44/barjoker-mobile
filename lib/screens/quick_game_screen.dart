import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dares.dart';

// import '../widgets/dare_display.dart';
import '../widgets/logo.dart';

class QuickGameScreen extends StatefulWidget {
  static const String routeName = '/quickgame';
  @override
  _QuickGameScreenState createState() => _QuickGameScreenState();
}

class _QuickGameScreenState extends State<QuickGameScreen> {
  // static const String routeName = '/quickgame';
  String dare = '';
  String success = '';
  String punishment = '';

  bool _newGame = true;
  bool _isSuccess = false;
  bool _isPunishment = false;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final dares = Provider.of<Dares>(context);
    return Scaffold(
      appBar: AppBar(  
        title: Text('Barjoker'),
      ),
      body: Container( 
        width: deviceSize.width,
        child: Column(  
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 25),
            BarjokerLogo( 
              height: deviceSize.height * .15,
              size: 35,
            ),
            Container(
              // padding: EdgeInsets.only(top: 50),
              margin: EdgeInsets.all(20.0),
              height: deviceSize.height * .30,
              child: Center(
                child: _newGame 
                ? newDareButton(dares) 
                // : DareDisplay(dare, 'dare'),
                : dareView(dare, deviceSize)
              ),
            ),
            if(!_newGame) 
              Column( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  resultOptions(dares, deviceSize),
                  // _isSuccess ? DareDisplay(success, 'success') : DareDisplay(punishment, 'punishment')
                  // _isSuccess ? GameModal(success) : GameModal(punishment)
                  SizedBox(height: 15,),
                  vetoButton(dares, 'dare', null)
                ]
              ),
              rules(deviceSize)
          ],
        ),
      ),
    );
  }

  Widget dareView(String dare, deviceSize) {
    print('TV');
    return Container( 
      width: deviceSize.width * .89,
      height: deviceSize.height * .6,
      // decoration: BoxDecoration(  
      //   image: DecorationImage(  
      //     image: AssetImage('images/tv_pitcher.png'),
          
      //     fit: BoxFit.contain
      //   )
      // ),
      // child: Text(
      //   dare,
      //   style: TextStyle(  
      //     fontSize: 20
      //   ),
      //   )
      child: Stack(  
        fit: StackFit.expand,
        children: <Widget>[
          Image(  
            image: AssetImage('images/tv_pitcher.png'),
            fit: BoxFit.cover
          ),
          Align( 
            
            alignment: Alignment(0.0, -0.3),
            child: Container( 
              width: deviceSize.width * .65,
              child: Text(
                  dare,
                  style: TextStyle(  
                    fontSize: 20
                  ),
                )
            
            )
          )
        ],
      ),
    );
  }

  Widget vetoButton(Dares dares, String type, StateSetter setStateModal) {
    return FlatButton( 
      child: Text(
        'Veto',
        style: TextStyle(  
          fontSize: 15
        ),
      ),
      onPressed: () {
        // print(type);
        
          if(type == 'dare') {
            setState(() {
              dare = dares.randomDare(type);  
            });
            // Navigator.pop(context);
          }
          if(type == 'success') {
            setStateModal(() {
              success = dares.randomDare(type);
            });
            
            // Navigator.pop(context);
          }
          if(type == 'punishment') {
            setStateModal(() {
              punishment = dares.randomDare(type);
            });
            // Navigator.pop(context);
          }
        // if(type != 'dare') {
        //   displayModal(context, dares, type);
        // }
      },
    );
  }

  Widget newDareButton(Dares dares) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 50,
      width: 150,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          'New dare',
          style: TextStyle(  
            fontSize: 20,
            color: Colors.white
          ),  
        ),
        onPressed: () {
          setState(() {
            dare = dares.randomDare('dare');
            print(dare);
            _newGame = false; 
          });
        },
      ),
    );
  }

  Widget resultOptions(Dares dares, deviceSize) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          height: 70,
          width: 200,
          child: RaisedButton( 
            child: Text(
              'Success',
              style: TextStyle(  
                color: Colors.white,
                fontSize: 20
              ),
            ),
            color: Colors.green,
            onPressed: () {
              setState(() {
                success = dares.randomDare('success');
                _isSuccess = true;
                _isPunishment = false;
              });
              displayModal(context, dares, 'success', deviceSize);
            },
          ),
        ),
        SizedBox(width: 10,),
        Container(
          padding: EdgeInsets.all(10),
          height: 70,
          width: 200,
          child: RaisedButton( 
            child: Text(
              'Punishment',
              style: TextStyle(  
                color: Colors.white,
                fontSize: 20
              ),
            ),
            color: Colors.red,
            onPressed: () {
              setState(() {
                punishment = dares.randomDare('punishment');
                _isPunishment = true;
                _isSuccess = false;
              });
              displayModal(context, dares, 'punishment', deviceSize);
            },
          ),
        ),
      ],
    );
  }

  void displayModal(BuildContext context, Dares dares, String type, deviceSize) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateModal) {
              return Container(
                height: deviceSize.height * .45,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: deviceSize.height * .3,
                      child: Center(child: Text(_isSuccess ? success : punishment))
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'New Dare',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                          dare = dares.randomDare('dare');
                        });
                      },
                    ),
                    vetoButton(dares, type, setStateModal)
                  ]
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget rules(deviceSize) {
    return Container(
      height: deviceSize.height * .1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            child: Text(
              'RULES',
              style: TextStyle(  
                fontSize: 15
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('RULES'),
                  content: rulesList(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
  
  Widget rulesList() {
    return SingleChildScrollView(
      child: Column(  
        children: <Widget>[
          rulesText('Start by daring one person. If that person succeeds, then they choose who to dare'),
          SizedBox(height: 5,),
          rulesText('In any dispute, anyone named Jacob (or "Jake") loses.'),
          SizedBox(height: 5,),
          rulesText('No one is allowed to know that you are playing a game at any time! Or you will lose.'),
          SizedBox(height: 5,),
          rulesText('Feel free to ad-lib your own rule/dare at any time.'),
          SizedBox(height: 5,),
          // rulesText('Rules are for losers'),
          // SizedBox(height: 5,),
        ],
      ),
    );
  }

  Widget rulesText(String text) {
    return Text( 
      text,
      style: TextStyle(  
        fontSize: 16
      ),
    );
  }
}


