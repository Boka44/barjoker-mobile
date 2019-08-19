import 'package:flutter/material.dart';

// Displays the message based off of type

class DareDisplay extends StatelessWidget {
  final String message;
  final String type;

  DareDisplay(this.message, this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _dare(message, type)
    );
  }
}

Widget _dare(String message, String type) {
  var color;
  if(type == 'dare') {
    color = Colors.black;
  }
  if(type == 'success') {
    color = Colors.green;
  }
  if(type == 'punishment') {
    color = Colors.red;
  }
  return Text(
    message,
    style: TextStyle(
      color: color
    ),
  );
}