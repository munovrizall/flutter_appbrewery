import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const CircleAvatar(
                radius: 70,
                foregroundImage: AssetImage('images/photo.jpg'),
              ),
              const Text(
                'M. Novrizal',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'MOBILE DEVELOPER',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SourceSans3',
                  color: Colors.teal[100],
                ),
              ),
              SizedBox(
                height: 24,
                width: 160,
                child: Divider(
                  thickness: 1,
                  color: Colors.teal.shade100,
                ),
              ),
              const Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 24,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+62 851 5541 4564',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 24,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'muhammadnovrizal87@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
