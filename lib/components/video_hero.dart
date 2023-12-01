import 'package:flutter/material.dart';
// import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoHero extends StatefulWidget {
  const VideoHero({super.key});

  @override
  State<VideoHero> createState() => _VideoHeroState();
}

class _VideoHeroState extends State<VideoHero> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(
        'web/assets/video/v1.mp4',
  
      );

    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
  }
  
  @override
  void dispose() {
    _videoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Butterfly Video'),
      ),
      
      body: FutureBuilder(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          setState(() {
            
            if (_videoPlayerController.value.isPlaying) {
              _videoPlayerController.pause();
            } else {
              
              _videoPlayerController.play();
            }
          });
        },
        
        child: Icon(
          _videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
