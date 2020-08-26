class TestStrings {
  static const String teamsServiceTestSuccessResponseBody = """
      [
  {
    "code": "NIG",
    "name": "Nigeria",
    "alias": "The Super Eagles",
    "description": "The Nigerian national football team",
    "hexColor": "#ffffff",
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/400px-Flag_of_Nigeria.svg.png",
    "foundedOn": "1933-08-21"
  },
  {
    "code": "ARG",
    "name": "Argentina",
    "alias": "La Albiceleste",
    "description": "The Argentine national football team",
    "hexColor": "#ffffff",
    "imageUrl": "https://upload.wikimedia.org/wikipedia/en/8/84/Afa_logo_jerseys.png",
    "foundedOn": "1867-05-09"
  },
  {
    "code": "BRA",
    "name": "Brazil",
    "alias": "Seleção",
    "description": "The Brazil national team",
    "hexColor": "#ffffff",
    "imageUrl": "https://upload.wikimedia.org/wikipedia/en/thumb/9/99/Brazilian_Football_Confederation_logo.svg/340px-Brazilian_Football_Confederation_logo.svg.png",
    "foundedOn": "1914-06-08"
  }
]
      """;

  static const  String tableServiceTestSuccessResponseBody = """{
   "api":{
      "results":1,
      "standings":[
         [
            {
               "rank":20,
               "team_id":37,
               "teamName":"Huddersfield",
               "logo":"https://media.api-sports.io/football/teams/37.png",
               "group":"Premier League",
               "forme":"DDLLL",
               "status":"",
               "description":"Relegation - Championship",
               "all":{
                  "matchsPlayed":38,
                  "win":3,
                  "draw":7,
                  "lose":28,
                  "goalsFor":22,
                  "goalsAgainst":76
               },
               "home":{
                  "matchsPlayed":19,
                  "win":2,
                  "draw":3,
                  "lose":14,
                  "goalsFor":10,
                  "goalsAgainst":31
               },
               "away":{
                  "matchsPlayed":19,
                  "win":1,
                  "draw":4,
                  "lose":14,
                  "goalsFor":12,
                  "goalsAgainst":45
               },
               "goalsDiff":-54,
               "points":16,
               "lastUpdate":"2019-05-12"
            }
         ]
      ]
   }
} """;
  static const String signUpServiceTestErrorResponseBody = "";

  static const String signUpServiceTestSuccessResponseBody =
      '''{"success": true,"error_message": null}''';

  static const String resetPasswordServiceTestErrorResponseBody =
      '''{"success": false,"error_message": "Could not reset password"}''';

  static const String resetPasswordServiceTestSuccessResponseBody =
      '''{"success": true,"error_message": null}''';

  static const String playersServiceTestSuccessResponseBody = """[
   {
      "player":{
         "id":17,
         "name":"C. Pulisic",
         "firstname":"Christian",
         "lastname":"Pulisic",
         "age":22,
         "birth":{
            "date":"1998-09-18",
            "place":"Hershey",
            "country":"USA"
         },
         "nationality":"USA",
         "height":"172 cm",
         "weight":"69 kg",
         "injured":false,
         "photo":"https://media.api-sports.io/football/players/17.png"
      },
      "statistics":[
         {
            "team":{
               "id":49,
               "name":"Chelsea",
               "logo":"https://media.api-sports.io/football/teams/49.png"
            },
            "league":{
               "id":39,
               "name":"Premier League",
               "country":"England",
               "logo":"https://media.api-sports.io/football/leagues/39.png",
               "flag":"https://media.api-sports.io/flags/gb.svg",
               "season":2019
            },
            "games":{
               "appearences":25,
               "lineups":19,
               "minutes":1727,
               "number":null,
               "position":"Midfielder",
               "rating":"6.916000",
               "captain":false
            },
            "substitutes":{
               "in":6,
               "out":11,
               "bench":10
            },
            "shots":{
               "total":63,
               "on":26
            },
            "goals":{
               "total":9,
               "conceded":null,
               "assists":4,
               "saves":null
            },
            "passes":{
               "total":534,
               "key":31,
               "accuracy":79
            },
            "tackles":{
               "total":23,
               "blocks":0,
               "interceptions":6
            },
            "duels":{
               "total":318,
               "won":128
            },
            "dribbles":{
               "attempts":108,
               "success":55,
               "past":null
            },
            "fouls":{
               "drawn":30,
               "committed":14
            },
            "cards":{
               "yellow":0,
               "yellowred":0,
               "red":0
            },
            "penalty":{
               "won":2,
               "commited":null,
               "scored":0,
               "missed":0,
               "saved":null
            }
         }
      ]
   }
]""";
  static const String loginServiceTestErrorResponseBody =
      '''{"success": false,"error_message": "Could not login"}''';

  static const String loginServiceTestSuccessResponseBody =
      '''{"success": true,"error_message": null}''';

  static const String articleServiceTestSuccessResponseBody = """
    [
  {
    "slug": "aa",
    "section": "transfers",
    "title": "Manchester United transfer dilemma shows how quickly priorities can change",
    "creationDate": "2020-06-22",
    "body": "When Ole Gunnar Solskjaer played down his post-match chat with Bournemouth defender Nathan Ake he focused on quantity when it comes to his options at the back.The United boss was caught in discussion with Ake after the 5-2 win at Old Trafford on Saturday and it was reported he told the Dutchman: We need a left-footed centre-back, so keep going.But while that had led to days of speculation that United could be considering a move for Ake, who is expected to leave Bournemouth this summer, Solskjaer played it down during his press conference on Wednesday I've got seven centre-backs, I don't know where that's come from. We're fine, the United boss said. You could arguably make that eight centre-backs with teenager Teden Mengi training with the first-team since the season restarted, but the issue for United is less one of quantity, and more an issue of quality.",
    "image": "https://i2-prod.manchestereveningnews.co.uk/incoming/article18561953.ece/ALTERNATES/s810/0_GettyImages-1254867027.jpg",
    "author": "Tyrone Marshall",
    "location": "Lagos, Nigeria",
    "wordCount": 15,
    "about": "Ole Gunnar Solskjaer has played down the need for Man Utd to sign a central defender but it's something he might still have to consider.",
    "status": "draft",
    "publishedDate": "2020-06-22",
    "contributors": [
      "Samuel Luckhurst",
      "Richard Fay"
    ]
  },
  {
    "slug": "cc",
    "section": "transfers",
    "title": "Manchester United transfer dilemma shows how quickly priorities can change",
    "creationDate": "2020-06-22",
    "body": "When Ole Gunnar Solskjaer played down his post-match chat with Bournemouth defender Nathan Ake he focused on quantity when it comes to his options at the back. The United boss was caught in discussion with Ake after the 5-2 win at Old Trafford on Saturday and it was reported he told the Dutchman: We need a left-footed centre-back, so keep going. But while that had led to days of speculation that United could be considering a move for Ake, who is expected to leave Bournemouth this summer, Solskjaer played it down during his press conference on Wednesday I've got seven centre-backs, I don't know where that's come from. We're fine, the United boss said. You could arguably make that eight centre-backs with teenager Teden Mengi training with the first-team since the season restarted, but the issue for United is less one of quantity, and more an issue of quality.",
    "image": "https://i2-prod.manchestereveningnews.co.uk/incoming/article18561953.ece/ALTERNATES/s810/0_GettyImages-1254867027.jpg",
    "author": "Tyrone Marshall",
    "location": "Lagos, Nigeria",
    "wordCount": 15,
    "about": "Ole Gunnar Solskjaer has played down the need for Man Utd to sign a central defender but it's something he might still have to consider.",
    "status": "draft",
    "publishedDate": "2020-06-22",
    "contributors": []
  }
]
      """;
}
