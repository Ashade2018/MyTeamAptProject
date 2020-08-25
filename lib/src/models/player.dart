// To parse this JSON data, do
//
//     final player = playerFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Player {
  Player({
    @required this.playerInfo,
    @required this.statistics,
  });

  final PlayerInfo playerInfo;
  final List<Statistic> statistics;

  factory Player.fromJson(String str) => Player.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        playerInfo: PlayerInfo.fromMap(json["player"]),
        statistics: List<Statistic>.from(
            json["statistics"].map((x) => Statistic.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "player": playerInfo.toMap(),
        "statistics": List<dynamic>.from(statistics.map((x) => x.toMap())),
      };
}

class PlayerInfo {
  PlayerInfo({
    @required this.id,
    @required this.name,
    @required this.firstname,
    @required this.lastname,
    @required this.age,
    @required this.birth,
    @required this.nationality,
    @required this.height,
    @required this.weight,
    @required this.injured,
    @required this.photo,
  });

  final int id;
  final String name;
  final String firstname;
  final String lastname;
  final int age;
  final Birth birth;
  final String nationality;
  final String height;
  final String weight;
  final bool injured;
  final String photo;

  factory PlayerInfo.fromJson(String str) =>
      PlayerInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlayerInfo.fromMap(Map<String, dynamic> json) => PlayerInfo(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        birth: Birth.fromMap(json["birth"]),
        nationality: json["nationality"],
        height: json["height"],
        weight: json["weight"],
        injured: json["injured"],
        photo: json["photo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "birth": birth.toMap(),
        "nationality": nationality,
        "height": height,
        "weight": weight,
        "injured": injured,
        "photo": photo,
      };
}

class Birth {
  Birth({
    @required this.date,
    @required this.place,
    @required this.country,
  });

  final DateTime date;
  final String place;
  final String country;

  factory Birth.fromJson(String str) => Birth.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Birth.fromMap(Map<String, dynamic> json) => Birth(
        date: DateTime.parse(json["date"]),
        place: json["place"],
        country: json["country"],
      );

  Map<String, dynamic> toMap() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "place": place,
        "country": country,
      };
}

class Statistic {
  Statistic({
    @required this.team,
    @required this.league,
    @required this.games,
    @required this.substitutes,
    @required this.shots,
    @required this.goals,
    @required this.passes,
    @required this.tackles,
    @required this.duels,
    @required this.dribbles,
    @required this.fouls,
    @required this.cards,
    @required this.penalty,
  });

  final Team team;
  final League league;
  final Games games;
  final Substitutes substitutes;
  final Shots shots;
  final Goals goals;
  final Passes passes;
  final Tackles tackles;
  final Duels duels;
  final Dribbles dribbles;
  final Fouls fouls;
  final Cards cards;
  final Penalty penalty;

  factory Statistic.fromJson(String str) => Statistic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Statistic.fromMap(Map<String, dynamic> json) => Statistic(
        team: Team.fromMap(json["team"]),
        league: League.fromMap(json["league"]),
        games: Games.fromMap(json["games"]),
        substitutes: Substitutes.fromMap(json["substitutes"]),
        shots: Shots.fromMap(json["shots"]),
        goals: Goals.fromMap(json["goals"]),
        passes: Passes.fromMap(json["passes"]),
        tackles: Tackles.fromMap(json["tackles"]),
        duels: Duels.fromMap(json["duels"]),
        dribbles: Dribbles.fromMap(json["dribbles"]),
        fouls: Fouls.fromMap(json["fouls"]),
        cards: Cards.fromMap(json["cards"]),
        penalty: Penalty.fromMap(json["penalty"]),
      );

  Map<String, dynamic> toMap() => {
        "team": team.toMap(),
        "league": league.toMap(),
        "games": games.toMap(),
        "substitutes": substitutes.toMap(),
        "shots": shots.toMap(),
        "goals": goals.toMap(),
        "passes": passes.toMap(),
        "tackles": tackles.toMap(),
        "duels": duels.toMap(),
        "dribbles": dribbles.toMap(),
        "fouls": fouls.toMap(),
        "cards": cards.toMap(),
        "penalty": penalty.toMap(),
      };
}

class Cards {
  Cards({
    @required this.yellow,
    @required this.yellowred,
    @required this.red,
  });

  final int yellow;
  final int yellowred;
  final int red;

  factory Cards.fromJson(String str) => Cards.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cards.fromMap(Map<String, dynamic> json) => Cards(
        yellow: json["yellow"],
        yellowred: json["yellowred"],
        red: json["red"],
      );

  Map<String, dynamic> toMap() => {
        "yellow": yellow,
        "yellowred": yellowred,
        "red": red,
      };
}

class Dribbles {
  Dribbles({
    @required this.attempts,
    @required this.success,
    @required this.past,
  });

  final int attempts;
  final int success;
  final int past;

  factory Dribbles.fromJson(String str) => Dribbles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dribbles.fromMap(Map<String, dynamic> json) => Dribbles(
        attempts: json["attempts"],
        success: json["success"],
        past: json["past"],
      );

  Map<String, dynamic> toMap() => {
        "attempts": attempts,
        "success": success,
        "past": past,
      };
}

class Duels {
  Duels({
    @required this.total,
    @required this.won,
  });

  final int total;
  final int won;

  factory Duels.fromJson(String str) => Duels.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Duels.fromMap(Map<String, dynamic> json) => Duels(
        total: json["total"],
        won: json["won"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "won": won,
      };
}

class Fouls {
  Fouls({
    @required this.drawn,
    @required this.committed,
  });

  final int drawn;
  final int committed;

  factory Fouls.fromJson(String str) => Fouls.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Fouls.fromMap(Map<String, dynamic> json) => Fouls(
        drawn: json["drawn"],
        committed: json["committed"],
      );

  Map<String, dynamic> toMap() => {
        "drawn": drawn,
        "committed": committed,
      };
}

class Games {
  Games({
    @required this.appearences,
    @required this.lineups,
    @required this.minutes,
    @required this.number,
    @required this.position,
    @required this.rating,
    @required this.captain,
  });

  final int appearences;
  final int lineups;
  final int minutes;
  final int number;
  final String position;
  final String rating;
  final bool captain;

  factory Games.fromJson(String str) => Games.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Games.fromMap(Map<String, dynamic> json) => Games(
        appearences: json["appearences"],
        lineups: json["lineups"],
        minutes: json["minutes"],
        number: json["number"],
        position: json["position"],
        rating: json["rating"],
        captain: json["captain"],
      );

  Map<String, dynamic> toMap() => {
        "appearences": appearences,
        "lineups": lineups,
        "minutes": minutes,
        "number": number,
        "position": position,
        "rating": rating,
        "captain": captain,
      };
}

class Goals {
  Goals({
    @required this.total,
    @required this.conceded,
    @required this.assists,
    @required this.saves,
  });

  final int total;
  final int conceded;
  final int assists;
  final int saves;

  factory Goals.fromJson(String str) => Goals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Goals.fromMap(Map<String, dynamic> json) => Goals(
        total: json["total"],
        conceded: json["conceded"],
        assists: json["assists"],
        saves: json["saves"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "conceded": conceded,
        "assists": assists,
        "saves": saves,
      };
}

class League {
  League({
    @required this.id,
    @required this.name,
    @required this.country,
    @required this.logo,
    @required this.flag,
    @required this.season,
  });

  final int id;
  final String name;
  final String country;
  final String logo;
  final String flag;
  final int season;

  factory League.fromJson(String str) => League.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory League.fromMap(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
      };
}

class Passes {
  Passes({
    @required this.total,
    @required this.key,
    @required this.accuracy,
  });

  final int total;
  final int key;
  final int accuracy;

  factory Passes.fromJson(String str) => Passes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Passes.fromMap(Map<String, dynamic> json) => Passes(
        total: json["total"],
        key: json["key"],
        accuracy: json["accuracy"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "key": key,
        "accuracy": accuracy,
      };
}

class Penalty {
  Penalty({
    @required this.won,
    @required this.commited,
    @required this.scored,
    @required this.missed,
    @required this.saved,
  });

  final int won;
  final int commited;
  final int scored;
  final int missed;
  final int saved;

  factory Penalty.fromJson(String str) => Penalty.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Penalty.fromMap(Map<String, dynamic> json) => Penalty(
        won: json["won"],
        commited: json["commited"],
        scored: json["scored"],
        missed: json["missed"],
        saved: json["saved"],
      );

  Map<String, dynamic> toMap() => {
        "won": won,
        "commited": commited,
        "scored": scored,
        "missed": missed,
        "saved": saved,
      };
}

class Shots {
  Shots({
    @required this.totalShots,
    @required this.onShots,
  });

  final int totalShots;
  final int onShots;

  factory Shots.fromJson(String str) => Shots.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Shots.fromMap(Map<String, dynamic> json) => Shots(
        totalShots: json["total"],
        onShots: json["on"],
      );

  Map<String, dynamic> toMap() => {
        "total": totalShots,
        "on": onShots,
      };
}

class Substitutes {
  Substitutes({
    @required this.substitutesIn,
    @required this.out,
    @required this.bench,
  });

  final int substitutesIn;
  final int out;
  final int bench;

  factory Substitutes.fromJson(String str) =>
      Substitutes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Substitutes.fromMap(Map<String, dynamic> json) => Substitutes(
        substitutesIn: json["in"],
        out: json["out"],
        bench: json["bench"],
      );

  Map<String, dynamic> toMap() => {
        "in": substitutesIn,
        "out": out,
        "bench": bench,
      };
}

class Tackles {
  Tackles({
    @required this.total,
    @required this.blocks,
    @required this.interceptions,
  });

  final int total;
  final int blocks;
  final int interceptions;

  factory Tackles.fromJson(String str) => Tackles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tackles.fromMap(Map<String, dynamic> json) => Tackles(
        total: json["total"],
        blocks: json["blocks"],
        interceptions: json["interceptions"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "blocks": blocks,
        "interceptions": interceptions,
      };
}

class Team {
  Team({
    @required this.id,
    @required this.name,
    @required this.logo,
  });

  final int id;
  final String name;
  final String logo;

  factory Team.fromJson(String str) => Team.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}
