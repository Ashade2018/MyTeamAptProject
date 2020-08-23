// To parse this JSON data, do
//
//     final table = tableFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Table {
    Table({
        @required this.api,
    });

    final Api api;

    factory Table.fromJson(String str) => Table.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Table.fromMap(Map<String, dynamic> json) => Table(
        api: Api.fromMap(json["api"]),
    );

    Map<String, dynamic> toMap() => {
        "api": api.toMap(),
    };
}

class Api {
    Api({
        @required this.results,
        @required this.standings,
    });

    final int results;
    final List<List<Standing>> standings;

    factory Api.fromJson(String str) => Api.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Api.fromMap(Map<String, dynamic> json) => Api(
        results: json["results"],
        standings: List<List<Standing>>.from(json["standings"].map((x) => List<Standing>.from(x.map((x) => Standing.fromMap(x))))),
    );

    Map<String, dynamic> toMap() => {
        "results": results,
        "standings": List<dynamic>.from(standings.map((x) => List<dynamic>.from(x.map((x) => x.toMap())))),
    };
}

class Standing {
    Standing({
        @required this.rank,
        @required this.teamId,
        @required this.teamName,
        @required this.logo,
        @required this.group,
        @required this.forme,
        @required this.status,
        @required this.description,
        @required this.all,
        @required this.home,
        @required this.away,
        @required this.goalsDiff,
        @required this.points,
        @required this.lastUpdate,
    });

    final int rank;
    final int teamId;
    final String teamName;
    final String logo;
    final String group;
    final String forme;
    final String status;
    final String description;
    final MatchesInfo all;
    final MatchesInfo home;
    final MatchesInfo away;
    final int goalsDiff;
    final int points;
    final DateTime lastUpdate;

    factory Standing.fromJson(String str) => Standing.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Standing.fromMap(Map<String, dynamic> json) => Standing(
        rank: json["rank"],
        teamId: json["team_id"],
        teamName: json["teamName"],
        logo: json["logo"],
        group: json["group"],
        forme: json["forme"],
        status: json["status"],
        description: json["description"],
        all: MatchesInfo.fromMap(json["all"]),
        home: MatchesInfo.fromMap(json["home"]),
        away: MatchesInfo.fromMap(json["away"]),
        goalsDiff: json["goalsDiff"],
        points: json["points"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
    );

    Map<String, dynamic> toMap() => {
        "rank": rank,
        "team_id": teamId,
        "teamName": teamName,
        "logo": logo,
        "group": group,
        "forme": forme,
        "status": status,
        "description": description,
        "all": all.toMap(),
        "home": home.toMap(),
        "away": away.toMap(),
        "goalsDiff": goalsDiff,
        "points": points,
        "lastUpdate": "${lastUpdate.year.toString().padLeft(4, '0')}-${lastUpdate.month.toString().padLeft(2, '0')}-${lastUpdate.day.toString().padLeft(2, '0')}",
    };
}

class MatchesInfo {
    MatchesInfo({
        @required this.matchsPlayed,
        @required this.win,
        @required this.draw,
        @required this.lose,
        @required this.goalsFor,
        @required this.goalsAgainst,
    });

    final int matchsPlayed;
    final int win;
    final int draw;
    final int lose;
    final int goalsFor;
    final int goalsAgainst;

    factory MatchesInfo.fromJson(String str) => MatchesInfo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MatchesInfo.fromMap(Map<String, dynamic> json) => MatchesInfo(
        matchsPlayed: json["matchsPlayed"],
        win: json["win"],
        draw: json["draw"],
        lose: json["lose"],
        goalsFor: json["goalsFor"],
        goalsAgainst: json["goalsAgainst"],
    );

    Map<String, dynamic> toMap() => {
        "matchsPlayed": matchsPlayed,
        "win": win,
        "draw": draw,
        "lose": lose,
        "goalsFor": goalsFor,
        "goalsAgainst": goalsAgainst,
    };
}
