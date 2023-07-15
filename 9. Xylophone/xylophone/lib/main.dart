import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              showButton('note1.wav', Colors.black),
              showButton('note2.wav', Colors.white),
              showButton('note3.wav', Colors.black),
              showButton('note4.wav', Colors.white),
              showButton('note5.wav', Colors.black),
              showButton('note6.wav', Colors.white),
              showButton('note7.wav', Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  Expanded showButton(String source, Color color) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          final player = AudioPlayer();
          player.play(
            AssetSource(source),
          );
        },
        child: null,
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith((states) => color),
        ),
      ),
    );
  }
}
