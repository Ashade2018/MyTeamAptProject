import 'dart:convert';
import 'package:meta/meta.dart';

class Article {
  Article({
    @required this.slug,
    @required this.section,
    @required this.title,
    @required this.creationDate,
    @required this.body,
    @required this.image,
    @required this.author,
    @required this.location,
    @required this.wordCount,
    @required this.about,
    @required this.status,
    @required this.publishedDate,
    @required this.contributors,
  });

  final String slug;
  final String section;
  final String title;
  final DateTime creationDate;
  final String body;
  final String image;
  final String author;
  final String location;
  final int wordCount;
  final String about;
  final String status;
  final DateTime publishedDate;
  final List<String> contributors;

  factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        slug: json["slug"],
        section: json["section"],
        title: json["title"],
        creationDate: DateTime.parse(json["creationDate"]),
        body: json["body"],
        image: json["image"],
        author: json["author"],
        location: json["location"],
        wordCount: json["wordCount"],
        about: json["about"],
        status: json["status"],
        publishedDate: DateTime.parse(json["publishedDate"]),
        contributors: (json["contributors"] as List).map((contributor) => contributor as String).toList(),
      );

  Map<String, dynamic> toMap() => {
        "slug": slug,
        "section": section,
        "title": title,
        "creationDate":
            "${creationDate.year.toString().padLeft(4, '0')}-${creationDate.month.toString().padLeft(2, '0')}-${creationDate.day.toString().padLeft(2, '0')}",
        "body": body,
        "image": image,
        "author": author,
        "location": location,
        "wordCount": wordCount,
        "about": about,
        "status": status,
        "publishedDate":
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "contributors": contributors,
      };
}
