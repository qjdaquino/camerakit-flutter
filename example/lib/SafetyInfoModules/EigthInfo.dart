import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class EighthInfo extends StatefulWidget {
  final String videoId = 'MGqfvhtbmOQ';
  const EighthInfo({super.key});

  @override
  State<EighthInfo> createState() =>
      _EighthInfo();
}

class _EighthInfo
    extends State<EighthInfo> {
  late YoutubePlayerController _controller;

  // For Custom Subtitle and Subtitle displaying duration
  List<Subtitle> subtitle = [];

  String subtitleText =
      "Secure your space by identifying hazards and securing moveable items"; // Your subtitle text here

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false))
      ..addListener(_onPlayerStateChange);
  }

  void _onPlayerStateChange() {
    if (_controller.value.playerState == PlayerState.playing) {
      final currentTime = _controller.value.position.inSeconds;
      final currentSubtitle = subtitle.firstWhere((subtitle) =>
      currentTime >= subtitle.start && currentTime <= subtitle.end);

      // Update the UI with the current subtitle
      setState(() {
        subtitleText = currentSubtitle.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              child: YoutubePlayer(controller: _controller),
            ),
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Secure Your Space', // Add your desired title here
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                subtitleText,
                style: const TextStyle(fontSize: 17, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Subtitle {
  final int start;
  final int end;
  final String text;

  Subtitle({required this.start, required this.end, required this.text});
}
