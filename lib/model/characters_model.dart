
import 'dart:convert';
List<CharacterModel> characterModelFromJson(String str)  =>
    List<CharacterModel>.from(json.decode(str).map((x)=>CharacterModel.fromJson(x)));

class CharacterModel {
  late int  charId;
  late String name;
  late String birthday;
  late List<dynamic> occupation;
  late String nickname;
  late List<dynamic> appearance;
  late String category;
  late String img;
  late String status;



  CharacterModel({required this.charId,
    required this.name, required this.nickname,
    required this.birthday,required this.occupation,
    required this.appearance,required this.category,
    required this.img,required this.status});

  factory CharacterModel.fromJson(Map<String,dynamic> json) =>CharacterModel( charId: json["char_id"],
    name: json["name"],
    nickname: json["nickname"],
    birthday: json["birthday"],
    occupation: json["occupation"],
    appearance: json["appearance"],
    category: json["category"],
    img:json['img'],
    status:json['status']
    );

  Map<String, dynamic> toJson() => {
    "char_id": charId,
    "name": name,
    "nickname": nickname,
    "birthday": birthday,
    "occupation": occupation,
    "appearance": appearance,
    "category": category,
    "img" : img,
    "status":status
  };
}