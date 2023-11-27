import 'package:flutter/material.dart';
import 'package:camerakit_flutter_example/youtube_player_custom_subtitles.dart';

class SafetyInfo extends StatelessWidget {
  const SafetyInfo({super.key});

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
      body: const YoutubePlayerCustomSubtitle(), // Assuming this widget works standalone
    );
  }
}
