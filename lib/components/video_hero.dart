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
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(
        'web/assets/video/v1.mp4',
      );
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true); // Optionnel : Boucler la vidéo
    _videoPlayerController.play(); // Optionnel : Lancer automatiquement la vidéo
  }
  
  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body: Stack(
        children: [
          FutureBuilder(
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
        const Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            
              children: [
                Text(
                  'France Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Atlas des données de France',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
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
        backgroundColor: const Color.fromARGB(255, 152, 191, 253),
            child: Icon(
              _videoPlayerController.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
              color: const Color.fromARGB(255, 254, 254, 254), // Couleur de l'icône
            ),
          ), 
      );
  }
}