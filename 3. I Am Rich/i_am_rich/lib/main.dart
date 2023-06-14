import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("I Am Rich"),
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.grey,
        body: 
        Center(
          child: Image(
              image: AssetImage('images/diamond.png')
         ),
        ),
      )
    ),
  );
}
