// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    @required this.name,
    @required this.species,
    @required this.gender,
    @required this.house,
    @required this.dateOfBirth,
    @required this.yearOfBirth,
    @required this.ancestry,
    @required this.eyeColour,
    @required this.hairColour,
    @required this.wand,
    @required this.patronus,
    @required this.hogwartsStudent,
    @required this.hogwartsStaff,
    @required this.actor,
    @required this.alive,
    @required this.image,
  });

  final String name;
  final Species species;
  final Gender gender;
  final String house;
  final String dateOfBirth;
  final dynamic yearOfBirth;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final Wand wand;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final bool alive;
  final String image;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        name: json["name"],
        species: speciesValues.map[json["species"]],
        gender: genderValues.map[json["gender"]],
        house: json["house"],
        dateOfBirth: json["dateOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        ancestry: json["ancestry"],
        eyeColour: json["eyeColour"],
        hairColour: json["hairColour"],
        wand: Wand.fromJson(json["wand"]),
        patronus: json["patronus"],
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alive: json["alive"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "species": speciesValues.reverse[species],
        "gender": genderValues.reverse[gender],
        "house": house,
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "ancestry": ancestry,
        "eyeColour": eyeColour,
        "hairColour": hairColour,
        "wand": wand.toJson(),
        "patronus": patronus,
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alive": alive,
        "image": image,
      };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

enum Species { HUMAN, HALF_GIANT, WEREWOLF, CAT }

final speciesValues = EnumValues({
  "cat": Species.CAT,
  "half-giant": Species.HALF_GIANT,
  "human": Species.HUMAN,
  "werewolf": Species.WEREWOLF
});

class Wand {
  Wand({
    @required this.wood,
    @required this.core,
    @required this.length,
  });

  final String wood;
  final String core;
  final dynamic length;

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: json["wood"],
        core: json["core"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "wood": wood,
        "core": core,
        "length": length,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
