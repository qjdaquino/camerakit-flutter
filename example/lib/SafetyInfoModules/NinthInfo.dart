import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class NinthInfo extends StatefulWidget {
  final String videoId = 'nbtrbwpS01M';
  const NinthInfo({super.key});

  @override
  State<NinthInfo> createState() =>
      _NinthInfo();
}

class _NinthInfo
    extends State<NinthInfo> {
  late YoutubePlayerController _controller;

  // For Custom Subtitle and Subtitle displaying duration
  List<Subtitle> subtitle = [];

  String subtitleText =
      "Fires, especially those that spark at home, often happen at night when you and your family are sleeping. It is for this reason that having smoke alarms where you live is a good idea.Here are some guidelines to follow as you install a fire detection system in your home:● Choose a detector with a backup battery so it will still do its job even when the power is out.● There should be a device in EVERY bedroom.● Make sure to install more than one smoke detector for long hallways and corridors.● If your home has more than one level, ensure that each floor has at least one smoke detector.Also, it is essential to plan where you’ll install your fire alarms. Consider these tips when choosing which areas in your home to put fire alarms in:● As much as possible, place smoke detectors on your ceiling and not on the walls.● Install smoke alarms in the middle of the room. They should never be in the corners or edges of your ceiling.● Keep smoke alarms away from ceiling fans, air-conditioning vents, and heat exhausts.● Don’t put a smoke detector in the kitchen; this might cause a false alarm.It isn’t enough to install fire alarms in your home. Once you have them, you need to maintain them. Otherwise, the device won’t be able to do what it was made to do.Follows these tips so you can take care of the smoke alarm system in your home:● Regularly test your smoke alarm. Designate the first Friday of every month to check whether all your detectors are still working.● Replace their batteries as soon as the alarm prompts you to.● Have replacement batteries on-hand so you can immediately change faulty smoke detector batteries."; // Your subtitle text here

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
                'Install Smoke Alarms in Your Place', // Add your desired title here
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
