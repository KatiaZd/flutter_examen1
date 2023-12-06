import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoHero extends StatefulWidget {
  const VideoHero({Key? key}) : super(key: key);

  @override
  State<VideoHero> createState() => _VideoHeroState();
}

class _VideoHeroState extends State<VideoHero> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildVideoPlayer(),
        buildTextWidgets(),
        buildFloatingActionButton(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(
      'web/assets/video/v1.mp4',
    );
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Widget buildVideoPlayer() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

 Widget buildTextWidgets() {
  return Positioned(
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    child: Center(
      child: ListView(
        shrinkWrap: true,
        children: const [
          Text(
            'France Data',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Atlas des données de France',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
              letterSpacing: 5,
            ),
          ),
        ],
      ),
    ),
  );
}


  Widget buildFloatingActionButton() {
    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_videoPlayerController.value.isPlaying) {
              _videoPlayerController.pause();
            } else {
              _videoPlayerController.play();
            }
          });
        },
        backgroundColor: const Color.fromARGB(255, 114, 166, 255),
        child: Icon(
          _videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
          color: const Color.fromARGB(255, 254, 254, 254),
        ),
      ),
    );
  }


}