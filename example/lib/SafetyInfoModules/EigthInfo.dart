import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class EighthInfo extends StatefulWidget {
  final String videoId = 'n9MpLF_SwkU';
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
      "No building is immune to fire. Even when you’re at home or work, make sure you already have an escape plan in mind.Familiarize yourself with the nearest fire exit in your building. At home, map out the fastest and safest way to go outside in case a fire starts.Consider these things when you’re mapping your fire escape plan:● Familiarize yourself with all the emergency fire exits in your building or home.● Make sure the doors in your plan can be opened from the inside.● Ensure that the path you map out is free from obstacles like bulky furniture or immovable appliances.● Agree on an area outside the building you’re in where you and your family or colleagues will meet after a fire.● Conduct or participate in fire drills so you can update your escape plan.● Have an alternative escape plan; Don’t settle for just one!"; // Your subtitle text here

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
                'Always Have an Escape Plan', // Add your desired title here
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
