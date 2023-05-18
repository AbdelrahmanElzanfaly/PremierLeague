import 'dart:convert';

import 'package:premier_league/Models/score_model.dart';
import 'package:premier_league/Models/team_model.dart';

class MatchModel {
  final int? id;
  final DateTime? utcDate;
  final String? status;
  final int? matchday;
  final String? stage;
  final DateTime? lastUpdated;
  final Score? score;
  final TeamModel? homeTeam;
  final TeamModel? awayTeam;

  MatchModel({
    this.id,
    this.utcDate,
    this.status,
    this.matchday,
    this.stage,
    this.lastUpdated,
    this.score,
    this.homeTeam,
    this.awayTeam,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        id: json["id"],
        utcDate: json["utcDate"] == DateTime.now()
            ? null
            : DateTime.parse(json["utcDate"]),
        status: json["status"] == null ? null : json["status"],
        matchday: json["matchday"],
        stage: json["stage"],
        lastUpdated: json["lastUpdated"] == null
            ? null
            : DateTime.parse(json["lastUpdated"]),
        score: json["score"] == null ? null : Score.fromJson(json["score"]),
        homeTeam: json["homeTeam"] == null
            ? null
            : TeamModel.fromJson(json["homeTeam"]),
        awayTeam: json["awayTeam"] == null
            ? null
            : TeamModel.fromJson(json["awayTeam"]),
      );

  static Map<String, dynamic> toMap(MatchModel match) => {
        "id": match.id,
        "utcDate": match.utcDate?.toIso8601String(),
        "status": match.status,
        "matchday": match.matchday,
        "stage": match.stage,
        "lastUpdated": match.lastUpdated?.toIso8601String(),
        "score": match.score?.toJson(),
        "homeTeam": match.homeTeam?.toJson(),
        "awayTeam": match.awayTeam?.toJson(),
      };

  static String encode(List<MatchModel> matches) => json.encode(
        matches.map<Map<String, dynamic>>((e) => MatchModel.toMap(e)).toList(),
      );

  static List<MatchModel> decode(String match) =>
      (json.decode(match) as List<dynamic>)
          .map<MatchModel>((item) => MatchModel.fromJson(item))
          .toList();
}
