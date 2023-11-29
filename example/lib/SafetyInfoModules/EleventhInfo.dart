import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class EleventhInfo extends StatefulWidget {
  final String videoId = 'rgr7UOYn1S8';
  const EleventhInfo({super.key});

  @override
  State<EleventhInfo> createState() =>
      _EleventhInfo();
}

class _EleventhInfo
    extends State<EleventhInfo> {
  late YoutubePlayerController _controller;

  // For Custom Subtitle and Subtitle displaying duration
  List<Subtitle> subtitle = [];

  String subtitleText =
      "Did you know that cooking is one of the leading causes of fire-related injuries and damages to date? It’s no surprise that the majority of house fires start in the kitchen.Even if this is the case, being afraid of a potential fire shouldn’t keep you from cooking in your own home. All you need to do is have fire safety and prevention measures in place to keep your kitchen from becoming a firetrap.We’ve compiled a handy list here for you to follow:● Never leave the kitchen when you are cooking something. If you need to go, turn off the burner. If you’re baking or roasting something in the oven, check on it from time to time. Use a kitchen timer to remind you of how much time has elapsed.● Be attentive every time you cook. Concentrate on what you’re doing.● Keep flammable things like dishcloths and paper towels away from stovetops and burners.● Ensure that your cooking surfaces are clean and grease-free.● Use your kitchen appliances wisely. Unplug them when you’re not using them. Make sure the kitchen equipment you buy passed fire safety standards.● Have a fire extinguisher in your kitchen."; // Your subtitle text here

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
                'Take Special Fire Precautions in the Kitchen', // Add your desired title here
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
