import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../controller/MusicHomeScreenProvider.dart';
import '../model/video_model.dart';
import '../utils/common.dart';

class VideoDetailScreen extends StatefulWidget {
  final videoDetails;

  VideoDetailScreen({super.key, this.videoDetails});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  // late VideoPlayerController videoPlayerController;
  // ChewieController? chewieController;

  void initState() {
    _initPlayer();
    super.initState();
  }

  HomeScreenProvider? hp;

  @override
  void didChangeDependencies() {
    hp = Provider.of<HomeScreenProvider>(context, listen: false);
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    // final providerVal = Provider.of<HomeScreenProvider>(context, listen: false);
    // providerVal.disposeMethod();
    hp!.videoPlayerController.dispose();
    hp!.chewieController!.dispose();
    super.dispose();
  }

  void _initPlayer() async {
    final providerVal = Provider.of<HomeScreenProvider>(context, listen: false);
    providerVal.setVideoPlayer = videoList[widget.videoDetails].video;

    /*videoPlayerController = VideoPlayerController.asset(videoList[widget.videoDetails].video);
    await videoPlayerController.initialize();

    setState(() {
      chewieController = ChewieController(
        useRootNavigator: true,
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        allowFullScreen: true,
        controlsSafeAreaMinimum: EdgeInsets.only(top: 10),
        fullScreenByDefault: true,
        showControls: true,
        allowMuting: true,
        allowPlaybackSpeedChanging: true,
        cupertinoProgressColors: ChewieProgressColors(
            backgroundColor: Colors.red, playedColor: darkColor),
      );
    });*/

// });
  }

  @override
  Widget build(BuildContext context) {
    final providerVal = Provider.of<HomeScreenProvider>(context, listen: true);
    return Scaffold(
      body: providerVal.chewieController != null
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Chewie(
                controller: providerVal.chewieController!,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
