// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:camerakit_flutter_example/main.dart';

class MyGuide extends StatelessWidget {
  const MyGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('User Guide'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => MyApp()));
          },
        ),
        centerTitle: true,
      ),
    ));
  }
}
