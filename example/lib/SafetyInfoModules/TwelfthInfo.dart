import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class TwelfthInfo extends StatefulWidget {
  final String videoId = 'PQV71INDaqY';
  const TwelfthInfo({super.key});

  @override
  State<TwelfthInfo> createState() =>
      _TwelfthInfo();
}

class _TwelfthInfo
    extends State<TwelfthInfo> {
  late YoutubePlayerController _controller;

  // For Custom Subtitle and Subtitle displaying duration
  List<Subtitle> subtitle = [];

  String subtitleText =
      "Fire extinguishers are common and useful tools against fires. They’re so common that you probably walked past one as you headed to work today.No matter home many times in a day you pass by the fire extinguisher in your office, you probably don’t know how to use it.When it comes to fires, not knowing how to use a fire extinguisher can cost you a lot. Remember, during emergencies, you can’t be fumbling around.Before learning how to use a fire extinguisher, you first have to know the different types. There are five different kinds of extinguishers based on the fires they can put out:Class A: fires fueled by everyday solid combustibles like paper and woodClass B: fuel- and gas-based firesClass C: fires caused by electricityClass D: fires fueled by flammable metalsClass K: used to extinguish oil and grease firesUsing a fire extinguisher is pretty straightforward and takes only minutes to learn. However, there are some necessary steps to using a fire extinguisher.There is a short and easy-to-remember acronym for using fire extinguishers. When the time comes that you need to use a fire extinguisher, remember to PASS:● PULL the safety pin from the handle. You won’t be able to use the extinguisher if you don’t pull it out.● AIM the nozzle at the base of the fire. Don’t hit the top of the flames.● SQUEEZE the trigger slowly. Moderate the pressure so you can control how much fluid comes out of the extinguisher.● SWEEP the nozzle from side to side. Not too fast or slow. Remember to aim at the base of the fire.Like smoke alarms, fire extinguishers also need the right amount of maintenance. Here are some fire safety tips for keeping your extinguishers in tip-top shape:● Make it a habit to visually inspect your fire extinguishers at home and work at least once a month. Their seals should be in-tact and undamaged in any way.● Have a professional inspect your fire extinguishers annually.● Empty and refill your extinguishers every six years. Make sure to consult a professional when doing this."; // Your subtitle text here

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
                'Learn to Use a Fire Extinguisher', // Add your desired title here
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
