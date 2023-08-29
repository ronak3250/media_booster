import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muscape/MusicHomeScreen/model/audio_model.dart';
import 'package:provider/provider.dart';

import '../controller/MusicHomeScreenProvider.dart';
import '../utils/common.dart';
import 'HomePage.dart';
class AudioDetailsScreen extends StatefulWidget {
  final indexvalue;

  AudioDetailsScreen({super.key, required this.indexvalue});

  @override
  State<AudioDetailsScreen> createState() => _AudioDetailsScreenState();
}

class _AudioDetailsScreenState extends State<AudioDetailsScreen> {
  final audiPlayer = AssetsAudioPlayer();
  //
  // Duration duration = Duration.zero;
 // Duration positon = Duration.zero;
 // bool isMute = false;
  Duration currentSliderValue = Duration.zero;

  @override
  void dispose() {
    audiPlayer.stop();
    audiPlayer.dispose();

    super.dispose();
  }

  @override
  void initState() {
   audiPlayer.open(Audio(audioList[widget.indexvalue].audio));
   print(audiPlayer.currentPosition.value.inSeconds);
   print('audiPlayer.currentPosition.value.inSeconds');


    // TODO: implement initState
    super.initState();
  }




  //
  // bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()), (
            route) => false);
        return true;
      },
      child: Consumer<HomeScreenProvider>(

        builder: (context, value, child) {

          audiPlayer.onReadyToPlay.listen((event) {
            // setState(() {
            //   duration = event!.duration;
            // });
            value.setduration=event!.duration;
          });
          String formateTime(Duration duration) {
            String twoDigits(int n) => n.toString().padLeft(2, '0');
            final hours = twoDigits(duration.inHours);
            final minutes = twoDigits(duration.inMinutes.remainder(60));
            final seconds = twoDigits(duration.inSeconds.remainder(60));
            if(hours =='00' && minutes=='00' && seconds=='00'){
              // setState(() {

              value.setisPlaying=false;
              // });
            }else {
              if(currentSliderValue!=Duration.zero) {
                value.setisPlaying = true;
              }
            }
            return [
              if (duration.inHours > 0) hours,
              minutes,
              seconds,
            ].join(':');
          }
          return Scaffold(
            body: Container(
              color: darkColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        child: Center(
                          child: Text("Music",
                              style: GoogleFonts.merriweather(fontSize: 30)),
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              int rawIndex = widget.indexvalue;
                              if (rawIndex != 0) {
                                rawIndex--;
                                audiPlayer.stop();


                                audiPlayer.dispose();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AudioDetailsScreen(
                                              indexvalue: rawIndex,)));
                              }
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size: 50,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 143,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                audioList[widget.indexvalue].poster,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              int rawindex = widget.indexvalue;
                              if (audioList.length - 1 != rawindex) {
                                rawindex++;
                                audiPlayer.stop();
                                audiPlayer.dispose();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AudioDetailsScreen(
                                              indexvalue: rawindex,)));
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                              size: 50,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            audioList[widget.indexvalue].songName,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StreamBuilder(
                          stream: audiPlayer.currentPosition,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            // setState(() {
                            currentSliderValue = (snapshot.data != null)
                                ? snapshot.data
                                : const Duration(seconds: 0) ;
                            // });

                            return Container(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Slider(
                                        value:
                                        currentSliderValue.inSeconds.toDouble(),
                                        max: value.duration.inSeconds.toDouble(),
                                        thumbColor: Colors.white,
                                        activeColor: Colors.white,
                                        inactiveColor: Colors.black,
                                        min: 0,
                                        onChanged: (val) async {


                                          // setState(() {
                                          //   positon =
                                          //       Duration(seconds: val.toInt());
                                          // });
                                          // print("val");
                                          // print(val);
                                          value.setPostion=Duration(seconds:val.toInt());

                                          //
                                          // final position =
                                          // Duration(seconds: val.toInt());
                                          await audiPlayer.seek(value.position);
                                          //await audiPlayer.pause();
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 22),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(formateTime(currentSliderValue)),
                                            Text(formateTime(
                                                value.duration - currentSliderValue)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [

                                      IconButton(
                                        onPressed: () async {
                                          Duration targetPosition =
                                              currentSliderValue -
                                                  Duration(seconds: 10);
                                          audiPlayer.seek(targetPosition);
                                        },
                                        icon: const Icon(
                                          Icons.fast_rewind,
                                          size: 34,
                                          color: Colors.white,
                                        ),
                                      ), FloatingActionButton(
                                        backgroundColor:
                                        darkColor.withOpacity(0.8),
                                        child: Icon(
                                          value.isPlaying==true?Icons.pause:Icons.play_arrow,
                                          size: 40,
                                        ),
                                        onPressed: () async {
                                        //  print(isPlaying);
                                          // audiPlayer.open(Audio(
                                          //   audioList[widget.indexvalue].audio,
                                          // ));


                                          if(value.isPlaying==false)
                                          {
                                            // setState(() async{
                                            //   isPlaying=!isPlaying;
                                            //   print("pause $isPlaying");
                                            //   await audiPlayer.play();
                                            //
                                            // });
                                            await audiPlayer.play();
                                            value.setisPlaying=!value.isPlaying;


                                          }
                                          else{
                                            // setState(() {
                                            //
                                            //
                                            //   isPlaying = !isPlaying;
                                            // });
                                            value.setisPlaying=!value.isPlaying;
                                            await audiPlayer.stop();
                                            // await audiPlayer.dispose();

                                          }




                                        },
                                      )
                                      ,
                                      IconButton(
                                        onPressed: () async {
                                          Duration targetPosition =
                                              currentSliderValue +
                                                  const Duration(seconds: 10);
                                          audiPlayer.seek(targetPosition);

                                          // print(currentSliderValue);
                                        },
                                        icon: const Icon(
                                          Icons.fast_forward,
                                          color: Colors.white,
                                          size: 34,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                value.setMute=value.isMute;
                                                  if (value.isMute) {
                                                    print(value.isMute);
                                                    await audiPlayer.setVolume(0.0);
                                                  } else {

                                                    print(value.isMute);
                                                    await audiPlayer.setVolume(1);
                                                  }


                                                  print(value.isMute);
                                              },
                                              icon: Icon(
                                                value.isMute==true
                                                    ? Icons.volume_mute
                                                    : Icons.volume_up,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        ),);
  }
}
