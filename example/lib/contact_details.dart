// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:camerakit_flutter_example/main.dart';
import 'package:url_launcher/url_launcher.dart';

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
                //QCDRRMO
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 230,
                        color: Color.fromARGB(255, 255, 193, 79),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 40, // Adjust the radius as needed
                              child: Image.network(
                                  'https://lh3.googleusercontent.com/drive-viewer/AK7aPaBCVB9bV9n_uTu1CHnV5-2huOhAT-k6tvWWOIuPb_ThX0uD3wADJT0VD13PoINdhqF3Pc2TVdIkQEZtEZ9b98iSVxG0fA=s2560'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('QCDRRMO',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 110,
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
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: IconButton(
                                      onPressed: () {
                                        // Add functionality for the call button
                                        launch('tel:+8988-4242');
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
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: IconButton(
                                      onPressed: () {
                                        launch(
                                            'mailto:QCDRRMO@quezoncity.gov.ph');
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
                //NDRRMC
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 230,
                        color: Color.fromARGB(255, 255, 193, 79),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor:
                              Colors.white, // Adjust the radius as needed
                              child: Image.network(
                                  'https://lh3.googleusercontent.com/drive-viewer/AK7aPaBzLxvEN4zoGRGYErfNvEfYvGOqzd2oqCiAeh303qBh0cb1PZWfn2Kzv_ioAsiCCVmz8YMdnGHufrRxPEj-YdIJPQmg=s1600'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('NDRRMC',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 110,
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
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: IconButton(
                                      onPressed: () {
                                        // Add functionality for the call button
                                        launch('tel:+8911 1406');
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
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: IconButton(
                                      onPressed: () {
                                        launch('mailto:ndrrmoc@ocd.gov.ph');
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
                //Marikina DRRMO
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 230,
                        color: Color.fromARGB(255, 255, 193, 79),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor:
                              Colors.white, // Adjust the radius as needed
                              child: Image.network(
                                  'https://lh3.googleusercontent.com/drive-viewer/AK7aPaAOTXbTBp0HWKd1v3CPqgbZRLRNJL6qAF6C8WK_qBYAOpOpVjY_L3VFrSPYtircB-sDzDmx7IwGo9V1Xw8Cka7s459mkg=s2560'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('MrDRRMO',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 110,
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
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: IconButton(
                                      onPressed: () {
                                        // Add functionality for the call button
                                        launch('tel:+0917 584 2168');
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
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                              Colors.black.withOpacity(0.2),
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 2))
                                        ]),
                                    child: IconButton(
                                      onPressed: () {
                                        launch(
                                            'mailto:drrmo.marikinacity@gmail.com');
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
                //Format code
                /*Padding(
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
                                        launch('tel:+0917 584 2168');
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
                                        launch(
                                            'mailto:drrmo.marikinacity@gmail.com');
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
                ),*/
              ],
            )));
  }
}
