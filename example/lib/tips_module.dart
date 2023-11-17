// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:camerakit_flutter_example/main.dart';

class Safetytips extends StatefulWidget {
  const Safetytips({super.key});

  @override
  _SafetytipsState createState() => _SafetytipsState();
}

class _SafetytipsState extends State<Safetytips> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  late Future<void> _initializeVideoPlayerFuture1;
  late Future<void> _initializeVideoPlayerFuture2;
  late Future<void> _initializeVideoPlayerFuture3;
  late Future<void> _initializeVideoPlayerFuture4;
  bool isPlaying1 = false;
  bool isPlaying2 = false;
  bool isPlaying3 = false;
  bool isPlaying4 = false;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerControllers.
    _controller1 = VideoPlayerController.network(
      'https://www.youtube.com/watch?v=K3kn_V8RTbs',
    );
    _controller2 = VideoPlayerController.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    );
    _controller3 = VideoPlayerController.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    );
    _controller4 = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controllers and store the Future for later use.
    _initializeVideoPlayerFuture1 = _controller1.initialize();
    _initializeVideoPlayerFuture2 = _controller2.initialize();
    _initializeVideoPlayerFuture3 = _controller3.initialize();
    _initializeVideoPlayerFuture4 = _controller4.initialize();

    // Use the controllers to loop the videos.
    _controller1.setLooping(true);
    _controller2.setLooping(true);
    _controller3.setLooping(true);
    _controller4.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerControllers to free up resources.
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Safety Information and Tips'),
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
            child: Column(
              children: [
                SafetyCard(
                  controller: _controller1,
                  initializeFuture: _initializeVideoPlayerFuture1,
                  isPlaying: isPlaying1,
                  cardText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla malesuada eros ut orci varius facilisis. Duis fringilla tempus purus id tempor. Donec non nibh tristique, pellentesque lorem sed, dapibus ante. Aenean porta mauris tellus, et aliquam leo congue vitae. Maecenas hendrerit posuere est nec scelerisque. Duis nisi justo, semper vitae sodales id, porttitor sit amet quam. Mauris at ligula fermentum, bibendum tellus sit amet, mattis orci. Quisque non egestas lorem, non porta felis. Morbi nunc est, finibus eu nisl ut, pretium molestie ex. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                ),
                SizedBox(height: 20),
                SafetyCard(
                  controller: _controller2,
                  initializeFuture: _initializeVideoPlayerFuture2,
                  isPlaying: isPlaying2,
                  cardText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla malesuada eros ut orci varius facilisis. Duis fringilla tempus purus id tempor. Donec non nibh tristique, pellentesque lorem sed, dapibus ante. Aenean porta mauris tellus, et aliquam leo congue vitae. Maecenas hendrerit posuere est nec scelerisque. Duis nisi justo, semper vitae sodales id, porttitor sit amet quam. Mauris at ligula fermentum, bibendum tellus sit amet, mattis orci. Quisque non egestas lorem, non porta felis. Morbi nunc est, finibus eu nisl ut, pretium molestie ex. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                ),
                // Add more SafetyCard widgets for additional videos as needed
                SizedBox(height: 20),
                SafetyCard(
                  controller: _controller3,
                  initializeFuture: _initializeVideoPlayerFuture3,
                  isPlaying: isPlaying3,
                  cardText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla malesuada eros ut orci varius facilisis. Duis fringilla tempus purus id tempor. Donec non nibh tristique, pellentesque lorem sed, dapibus ante. Aenean porta mauris tellus, et aliquam leo congue vitae. Maecenas hendrerit posuere est nec scelerisque. Duis nisi justo, semper vitae sodales id, porttitor sit amet quam. Mauris at ligula fermentum, bibendum tellus sit amet, mattis orci. Quisque non egestas lorem, non porta felis. Morbi nunc est, finibus eu nisl ut, pretium molestie ex. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                ),
                SizedBox(height: 20),
                SafetyCard(
                  controller: _controller4,
                  initializeFuture: _initializeVideoPlayerFuture4,
                  isPlaying: isPlaying4,
                  cardText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla malesuada eros ut orci varius facilisis. Duis fringilla tempus purus id tempor. Donec non nibh tristique, pellentesque lorem sed, dapibus ante. Aenean porta mauris tellus, et aliquam leo congue vitae. Maecenas hendrerit posuere est nec scelerisque. Duis nisi justo, semper vitae sodales id, porttitor sit amet quam. Mauris at ligula fermentum, bibendum tellus sit amet, mattis orci. Quisque non egestas lorem, non porta felis. Morbi nunc est, finibus eu nisl ut, pretium molestie ex. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
                ),
                SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SafetyCard extends StatefulWidget {
  final VideoPlayerController controller;
  final Future<void> initializeFuture;
  final bool isPlaying;
  final String cardText;

  const SafetyCard({super.key,
    required this.controller,
    required this.initializeFuture,
    required this.isPlaying,
    required this.cardText,
  });

  @override
  _SafetyCardState createState() => _SafetyCardState();
}

class _SafetyCardState extends State<SafetyCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          color: Color.fromARGB(255, 255, 193, 79),
          elevation: 5,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: widget.controller.value.aspectRatio,
                child: VideoPlayer(widget.controller),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.isPlaying ? widget.controller.pause() : widget.controller.play();
                  });
                },
                icon: Icon(
                  widget.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.cardText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}