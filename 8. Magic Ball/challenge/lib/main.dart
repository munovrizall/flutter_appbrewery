import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  var diceImage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Center(
        child: TextButton(
          child: Image.asset('images/ball$diceImage.png'),
          onPressed: () {
            randomBall();
          },
        ),
      ),
    );

  }

  void randomBall() {
    setState(() {
      diceImage = Random().nextInt(5) + 1;
    });
  }
}
