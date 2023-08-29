import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:muscape/MusicHomeScreen/view/HomePage.dart';

import '../model/audio_model.dart';

class carasoualSlideraudio extends StatefulWidget {
  const carasoualSlideraudio({super.key});

  @override
  State<carasoualSlideraudio> createState() => _carasoualSlideraudioState();
}

class _carasoualSlideraudioState extends State<carasoualSlideraudio> {
  int initPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: List.generate(audioList.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MusicPlayView(
                                audioValue: index,
                              )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(blurRadius: 0.4, spreadRadius: 0.3)
                      ],
                      image: DecorationImage(
                          image: AssetImage(audioList[index].poster),
                          fit: BoxFit.cover,
                          opacity: 0.6)),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          audioList[index].songName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
            options: CarouselOptions(
                height: 300,
                initialPage: initPage,
                onPageChanged: (index, reason) {
                  setState(() {
                    initPage = index;

                  });
                })),
        Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: Container(
              width: 300,
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: audioList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 20, right: 0),
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (initPage == index) ? Colors.grey : Colors.red),
                      ),
                    );
                  }),
            ))
      ],
    );
  }
}
