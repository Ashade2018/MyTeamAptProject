import 'package:meta/meta.dart';
import 'dart:convert';

class Player {
  Player({
    @required this.name,
    @required this.dateOfBirth,
    @required this.nationality,
  });

  final String name;
  final DateTime dateOfBirth;
  final String nationality;
  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());
  factory Player.fromMap(Map<String, dynamic> json) => Player(
        name: json["name"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        nationality: json["nationality"],
      );
  Map<String, dynamic> toMap() => {
        "name": name,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "nationality": nationality
      };
}
