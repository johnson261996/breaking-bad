
import 'dart:convert';

List<EpisodeModel> EpisodeModelFromJson(String str)  =>
    List<EpisodeModel>.from(json.decode(str).map((x)=>EpisodeModel.fromJson(x)));

class EpisodeModel {
  late int  episode_id;
  late String title;
  late String season;
  late List<dynamic> characters;
  late String air_date;
  late String episode;
  late String series;

  EpisodeModel({required this.episode_id,
    required this.title, required this.season,
    required this.characters,required this.air_date,
    required this.episode,required this.series,
  });

  factory EpisodeModel.fromJson(Map<String,dynamic> json) =>EpisodeModel(
      episode_id: json["episode_id"],
      title: json["title"],
      season: json["season"],
      characters: json["characters"],
      air_date: json["air_date"],
      episode: json["episode"],
      series: json["series"],
  );

  Map<String, dynamic> toJson() => {
    "episode_id": episode_id,
    "title": title,
    "season": season,
    "characters": characters,
    "air_date": air_date,
    "episode": episode,
    "series": series,
  };
}