import 'package:camerakit_flutter_example/SafetyInfoModules/EigthInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/EleventhInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/FifthInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/FourthInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/NinthInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/SecondInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/SeventhInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/SixthInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/TenthInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/ThirdInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/ThirteenthInfo.dart';
import 'package:camerakit_flutter_example/SafetyInfoModules/TwelfthInfo.dart';
import 'package:flutter/material.dart';
import 'SafetyInfoModules/FirstInfo.dart';

class SafetyInfo extends StatelessWidget {
  SafetyInfo({Key? key});

  // Mock data for the list of safety information
  final List<String> safetyInfoList = [
    'Default',
    'Secure Your Space',
    'Plan to be Safe',
    'Organize Disaster Supplies',
    'Minimize Financial Hardship',
    'Drop, Cover, and Hold On',
    'Improve Safety',
    'Reconnect and Restore',
    'Always Have an Escape Plan',
    'Install Smoke Alarms in Your Place',
    'Stay on Top of Your Electrical Wiring System',
    'Take Special Fire Precautions in the Kitchen',
    'Learn to Use a Fire Extinguisher',
    'Have a  Fire Safety Checklist',
    // Add more safety information as needed
  ];

  // Function to create different content for each safety info item
  Widget _buildDialogContent(int index) {
    // Customize the content based on the index or safety information selected
    switch (index) {
      case 0:
        return const FirstInfo();
      case 1:
        return const FirstInfo();
      case 2:
        return const SecondInfo();
      case 3:
        return const ThirdInfo();
      case 4:
        return const FourthInfo();
      case 5:
        return const FifthInfo();
      case 6:
        return const SixthInfo();
      case 7:
        return const SeventhInfo();
      case 8:
        return const EighthInfo();
      case 9:
        return const NinthInfo();
      case 10:
        return const TenthInfo();
      case 11:
        return const EleventhInfo();
      case 12:
        return const TwelfthInfo();
      case 13:
        return const ThirteenthInfo();



    // Add cases for other safety information as needed
      default:
        return const Text('Default Content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Information'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: safetyInfoList.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0 || index == 7) {
                  // Display images above Safety Info 1 and 6
                  return Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              index == 0
                                  ? 'https://static.vecteezy.com/system/resources/previews/007/640/091/original/earthquake-illustration-on-a-background-premium-quality-symbols-icons-for-concept-and-graphic-design-vector.jpg' // Image URL for Safety Info 1
                                  : 'https://media.istockphoto.com/id/1251567184/vector/fire-vector-isolated.jpg?s=612x612&w=0&k=20&c=l_BL45O1J5P94wGtfq_k7XxStOwrwSvvGWs8pipUzUI=', // Replace with your second image URL
                              height: 300, // Adjust the height as needed
                              width: double.infinity, // Occupy full width of the screen
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  // For other safety info items
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(safetyInfoList[index]),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Open a dialog when the button is pressed
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(''),
                                content: _buildDialogContent(index),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Button'),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
