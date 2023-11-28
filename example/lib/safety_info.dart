import 'package:flutter/material.dart';
import 'package:camerakit_flutter_example/youtube_player_custom_subtitles.dart';

class SafetyInfo extends StatelessWidget {
  SafetyInfo({Key? key});

  // Mock data for the list of safety information
  final List<String> safetyInfoList = [
    'Safety Info 1',
    'Safety Info 2',
    'Safety Info 3',
    'Safety Info 4',
    'Safety Info 5',
    'Safety Info 6',
    'Safety Info 7',
    'Safety Info 8',
    'Safety Info 9',
    'Safety Info 10',
    // Add more safety information as needed
  ];

  // Function to create different content for each safety info item
  Widget _buildDialogContent(int index) {
    // Customize the content based on the index or safety information selected
    switch (index) {
      case 0:
        return const YoutubePlayerCustomSubtitle();
      case 1:
        return const Text('2');
      case 2:
        return const Text('3');
      case 3:
        return const Text('4');
      case 4:
        return const Text('5');
      case 5:
        return const Text('6');
      case 6:
        return const Text('7');
      case 7:
        return const Text('8');
      case 8:
        return const Text('9');
      case 9:
        return const Text('10');

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
      body: ListView.builder(
        itemCount: safetyInfoList.length,
        itemBuilder: (BuildContext context, int index) {
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
                        title: Text('Dialog for ${safetyInfoList[index]}'),
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
        },
      ),
    );
  }
}
