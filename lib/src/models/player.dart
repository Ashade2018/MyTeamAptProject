import 'package:meta/meta.dart';
import 'dart:convert';

class Player {
  final String name;
  final DateTime dateOfBirth;
  final String nationality;
  final String imageUrl;
  final String publicImageId;


  Player({
    @required this.name,
    @required this.dateOfBirth,
    @required this.nationality,
    @required this.imageUrl,
    @required this.publicImageId,
  });

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        name: json["name"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        nationality: json["nationality"],
        imageUrl: json["imageUrl"],
        publicImageId: json["publicImageId"]
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "nationality": nationality,
        "imageUrl": imageUrl,
        "publicImageId": publicImageId
      };
}
