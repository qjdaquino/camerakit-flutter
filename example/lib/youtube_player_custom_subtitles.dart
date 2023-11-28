import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class YoutubePlayerCustomSubtitle extends StatefulWidget {
  final String videoId = 'fnl_-oBQF9M';
  const YoutubePlayerCustomSubtitle({super.key});

  @override
  State<YoutubePlayerCustomSubtitle> createState() =>
      _YoutubePlayerCustomSubtitleState();
}

class _YoutubePlayerCustomSubtitleState
    extends State<YoutubePlayerCustomSubtitle> {
  late YoutubePlayerController _controller;

  // For Custom Subtitle and Subtitle displaying duration
  List<Subtitle> subtitle = [];

  String subtitleText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ndustry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s..ndustry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s..ndustry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s..ndustry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s..ndustry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s..Lorem Ipsum has been the industry's standard dummy text ever since the 1500s..."; // Your subtitle text here

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
      appBar: AppBar(
        title: const Text("SAFETY INFO 1"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: const EdgeInsets.all(0),
              child: YoutubePlayer(controller: _controller),
            ),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                subtitleText,
                style: const TextStyle(fontSize: 17, color: Colors.black),
                textAlign: TextAlign.center,
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
