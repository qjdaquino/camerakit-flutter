import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class TenthInfo extends StatefulWidget {
  final String videoId = 'tbPKVMpEA6M';
  const TenthInfo({super.key});

  @override
  State<TenthInfo> createState() =>
      _TenthInfo();
}

class _TenthInfo
    extends State<TenthInfo> {
  late YoutubePlayerController _controller;

  // For Custom Subtitle and Subtitle displaying duration
  List<Subtitle> subtitle = [];

  String subtitleText =
      "Another fire safety and prevention tip to follow is to stay on top of your home electrical wiring system. Many fires also spark from faulty or dilapidated electrical wiring.As electrical wires hide behind the walls, it might be hard to check upon them. Here are some tips to help you keep your electrical wiring system in check:● Have a professional inspect the wires in your home. Do this at least once a year.● Replace faulty light bulbs in your house.● Call a professional right away if you’re experiencing intermittent electricity.● Don’t use exploded outlets."; // Your subtitle text here

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
                'Stay on Top of Your Electrical Wiring System', // Add your desired title here
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
