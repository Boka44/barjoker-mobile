import 'package:flutter/material.dart';

class BarjokerLogo extends StatelessWidget {
  final double height;
  final double size;

  BarjokerLogo({this.height, this.size});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width,
      height: height,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Image( 
          image: AssetImage('images/barjoker_logo.png')
        )
      ),
    );
  }
}