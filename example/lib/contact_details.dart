// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:camerakit_flutter_example/main.dart';

class MyContact extends StatelessWidget {
  const MyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Contact'),
              backgroundColor: Colors.orangeAccent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 220,
                        color: Color.fromARGB(255, 255, 193, 79),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 40, // Adjust the radius as needed
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person, //Replace with the Orgs image
                                color: Colors.black,
                                size: 50,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 120,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .blue, // Replace with your color
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        print('Call button pressed');
                                        // Add functionality for the call button
                                      },
                                      icon: Icon(Icons.phone),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .green, // Replace with your color
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        print('Email button pressed');
                                        // Add functionality for the email button
                                      },
                                      icon: Icon(Icons.email),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 220,
                        color: Color.fromARGB(255, 255, 193, 79),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 40, // Adjust the radius as needed
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person, //Replace with the Orgs image
                                color: Colors.black,
                                size: 50,
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 120,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .blue, // Replace with your color
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        print('Call button pressed');
                                        // Add functionality for the call button
                                      },
                                      icon: Icon(Icons.phone),
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .green, // Replace with your color
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        print('Email button pressed');
                                        // Add functionality for the email button
                                      },
                                      icon: Icon(Icons.email),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
