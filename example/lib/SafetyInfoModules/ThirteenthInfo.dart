import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class ThirteenthInfo extends StatefulWidget {
  final String videoId = 'sMSt-TWL_w0';
  const ThirteenthInfo({super.key});

  @override
  State<ThirteenthInfo> createState() =>
      _ThirteenthInfo();
}

class _ThirteenthInfo
    extends State<ThirteenthInfo> {
  late YoutubePlayerController _controller;

  // For Custom Subtitle and Subtitle displaying duration
  List<Subtitle> subtitle = [];

  String subtitleText =
      "Fires at work can be devastating. They pose a risk not only to the people inside the building.Workplace or building fires also affect the public. This is why preventing fires at the workplace is just as crucial as avoiding them at home.To keep you and yourself safe from building or office fires, make sure to check off all the items on this fire safety checklist:● Remove office fire hazards like faulty outlets, fraying electrical cords, and overloaded sockets.● Keep the office open and well-ventilated.● Make sure smoke alarms on all floors are working.● Promote fire safety by ensuring your entire floor attends and participates in fire drills.● Know where the maintenance staff keeps the fire extinguishers.● Keep the inside of the office as a no-smoking zone.● Add emergency hotlines in your office’s telephone directory on the automatic dial.● Unplug idle appliances like coffee makers and microwaves when nobody is using them.While fires may be unpredictable and destructive, they are also highly preventable. By practicing fire safety and prevention in your home and workplace, you make your community a safer place to live."; // Your subtitle text here

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
                'Have a Workplace Fire Safety Checklist', // Add your desired title here
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
