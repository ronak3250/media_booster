// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

List<VideoModel> videoModelFromJson(String str) => List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromJson(x)));

String videoModelToJson(List<VideoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoModel {
  String title;
  String thumbnail;
  String video;

  VideoModel({
    required this.title,
    required this.thumbnail,
    required this.video,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    title: json["title"],
    thumbnail: json["thumbnail"],
    video: json["video"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "thumbnail": thumbnail,
    "video": video,
  };
}

List<VideoModel> videoList=[
  VideoModel( title: 'Shree Hanuman Chalisa',
    thumbnail: 'assets/images/videoThumbnails/Shree_Hanuman_Chalisa.jpg',
    video: 'assets/videos/Shree_Hanuman_Chalisa.mp4',),
  VideoModel(title: 'Dr. Hathi Stuck In An Auto | TMKOC',
    thumbnail:
    'assets/images/videoThumbnails/Dr._Hathi_Stuck_In_An_Auto_TMKOC.jpg',
    video: 'assets/videos/Dr._Hathi_Stuck_In_An_Auto_TMKOC.mp4',),
  VideoModel(  title: 'Laadki Song',
    thumbnail: 'assets/images/videoThumbnails/Laadki_Song.jpg',
    video: 'assets/videos/Laadki_Song.mp4',),
  VideoModel( title: 'Chapakaru | Rajbha Gadhvi',
    thumbnail: 'assets/images/videoThumbnails/Chapakaru_Rajbha_Gadhvi.jpg',
    video: 'assets/videos/Chapakaru_Rajbha_Gadhvi.mp4',),
  VideoModel( title: 'How Grenades Work | Khan Sir',
    thumbnail: 'assets/images/videoThumbnails/How_Grenades_Work.jpg',
    video: 'assets/videos/How_Grenades_Work.mp4',),
  VideoModel(title: 'Google Pixel 7a Unboxing',
    thumbnail: 'assets/images/videoThumbnails/Google_Pixel_7a_Unboxing.jpg',
    video: 'assets/videos/Google_Pixel_7a_Unboxing.mp4',),
  VideoModel(title: 'Jag Ghoomeya Song',
    thumbnail: 'assets/images/videoThumbnails/Jag_Ghoomeya_Song.jpg',
    video: 'assets/videos/Jag_Ghoomeya_Song.mp4',),
  VideoModel( title: 'Motu Patlu Yamraj Episode 16',
    thumbnail:
    'assets/images/videoThumbnails/Motu_Patlu_Yamraj_Episode_16.jpg',
    video: 'assets/videos/Motu_Patlu_Yamraj_Episode_16.mp4',),
  VideoModel( title: 'Pa Pa Pagli Song',
    thumbnail: 'assets/images/videoThumbnails/Pa_Pa_Pagli_Song.jpg',
    video: 'assets/videos/Pa_Pa_Pagli_Song.mp4',),
  VideoModel( title: 'Case Study on Ajit Doval',
    thumbnail: 'assets/images/videoThumbnails/Case_Study_on_Ajit_Doval.jpg',
    video: 'assets/videos/Case_Study_on_Ajit_Doval.mp4',),

];
