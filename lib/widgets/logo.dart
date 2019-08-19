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
      // color: Colors.red,
      child: Center(
        child: Text(
          'Barjoker',
          style: TextStyle(  
            fontSize: size,
            fontWeight: FontWeight.bold
          )
        ),
      ),
    );
  }
}