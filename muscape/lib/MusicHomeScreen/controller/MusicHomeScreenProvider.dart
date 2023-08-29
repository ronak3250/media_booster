import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../model/video_model.dart';
import '../utils/common.dart';

class HomeScreenProvider with ChangeNotifier {
  bool _isMute = false;

  bool get isMute => _isMute;

  Duration _postion = Duration.zero;
  Duration _duration = Duration.zero;

  Duration get position => _postion;

  Duration get duration => _duration;
  bool _isPlaying = true;

  bool get isPlaying => _isPlaying;
  ChewieController? chewieController;
  late VideoPlayerController videoPlayerController;

  set setVideoPlayer(String assetStringVideo) {
    videoPlayerController = VideoPlayerController.asset(assetStringVideo);
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
    // notifyListeners();
  }




  disposeMethod(){
    videoPlayerController.dispose();
    chewieController?.dispose();
  }

  set setduration(value) {
    _duration = value;
    notifyListeners();
  }

  set setisPlaying(value) {
    _isPlaying = value;
    notifyListeners();
  }

  set setMute(value) {
    _isMute = !value;

    notifyListeners();
  }

  set setPostion(newpositon) {
    _postion = newpositon;
    notifyListeners();
  }
}
