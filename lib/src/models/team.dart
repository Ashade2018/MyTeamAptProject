// To parse this JSON data, do
//
//     final team = teamFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Team {
  Team({
    @required this.code,
    @required this.name,
    @required this.alias,
    @required this.description,
    @required this.hexColor,
    @required this.imageUrl,
    @required this.foundedOn,
  });

  final String code;
  final String name;
  final String alias;
  final String description;
  final String hexColor;
  final String imageUrl;
  final DateTime foundedOn;

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        code: json["code"],
        name: json["name"],
        alias: json["alias"],
        description: json["description"],
        hexColor: json["hexColor"],
        imageUrl: json["imageUrl"],
        foundedOn: DateTime.parse(json["foundedOn"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "name": name,
        "alias": alias,
        "description": description,
        "hexColor": hexColor,
        "imageUrl": imageUrl,
        "foundedOn":
            "${foundedOn.year.toString().padLeft(4, '0')}-${foundedOn.month.toString().padLeft(2, '0')}-${foundedOn.day.toString().padLeft(2, '0')}",
      };

  
}
