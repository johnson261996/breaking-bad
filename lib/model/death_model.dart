
import 'dart:convert';

List<DeathModel> DeathModelFromJson(String str)  =>
    List<DeathModel>.from(json.decode(str).map((x)=>DeathModel.fromJson(x)));

class DeathModel {
 late int death_id;
 late String death;
 late String cause;
 late String responsible;
 late String last_words;
 late int season;
 late int episode;
 late int number_of_deaths;

 DeathModel({required this.death_id, required this.death, required this.cause, required this.responsible,
      required this.last_words, required this.season, required this.episode, required this.number_of_deaths});

 factory DeathModel.fromJson(Map<String,dynamic> json) =>DeathModel(
     death_id: json["death_id"],
     death: json["death"],
     cause: json["cause"],
     responsible: json["responsible"],
     last_words: json["last_words"],
     season: json["season"],
     episode:json["episode"],
     number_of_deaths:json["number_of_deaths"],
 );

 Map<String, dynamic> toJson() => {
  "death_id":death_id,
  "death":death,
  "cause":cause,
  "responsible":responsible,
  "last_words":last_words,
  "season":season,
  "episode":episode,
  "number_of_deaths":number_of_deaths,
 };

}