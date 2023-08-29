import 'dart:convert';

List<AudioModel> audioModelFromJson(String str) => List<AudioModel>.from(json.decode(str).map((x) => AudioModel.fromJson(x)));

String audioModelToJson(List<AudioModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AudioModel {
  String songName;
  String poster;
  String audio;

  AudioModel({
    required this.songName,
    required this.poster,
    required this.audio,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
    songName: json["songName"],
    poster: json["poster"],
    audio: json["audio"],
  );

  Map<String, dynamic> toJson() => {
    "songName": songName,
    "poster": poster,
    "audio": audio,
  };
}

List<AudioModel> audioList=[
  AudioModel(songName: 'Daku', poster:'assets/images/songThumbnails/Daku.jpg', audio: 'assets/audio/Daku.mp3'),
  AudioModel( songName: 'Tujhe Kitna Chahne Lage',
    poster: "assets/images/songThumbnails/Tujhe_Kitna_Chahne_Lage.jpg",
    audio: "assets/audio/Tujhe_Kitna_Chahne_Lage.mp3",),
  AudioModel( songName: 'Excuses',
    poster: "assets/images/songThumbnails/Excuses.jpg",
    audio: "assets/audio/Excuses.mp3",),
  AudioModel( songName: 'Taki Taki',
    poster: "assets/images/songThumbnails/Taki_Taki.jpg",
    audio: "assets/audio/Taki_Taki.mp3",),
  AudioModel( songName: 'Tum Hi Ho',
    poster: "assets/images/songThumbnails/Tum_Hi_Ho.jpg",
    audio: "assets/audio/Tum_Hi_Ho.mp3",),
  AudioModel(songName: 'Raatan Lambiyan',
    poster: "assets/images/songThumbnails/Raatan_Lambiyan.jpg",
    audio: "assets/audio/Raatan_Lambiyan.mp3",),
  AudioModel(songName: 'Gangnam Style',
    poster: "assets/images/songThumbnails/Gangnam_Style.jpg",
    audio: "assets/audio/Gangnam_Style.mp3",),
  AudioModel( songName: 'Ram Siya Ram',
    poster: "assets/images/songThumbnails/Ram_Siya_Ram.jpg",
    audio: "assets/audio/Ram_Siya_Ram.mp3",),
  AudioModel( songName: 'Despacito',
    poster: "assets/images/songThumbnails/Despacito.jpg",
    audio: "assets/audio/Despacito.mp3",),
  AudioModel( songName: 'Calm Down',
    poster: "assets/images/songThumbnails/Calm_Down.jpg",
    audio: "assets/audio/Calm_Down.mp3",),
];
