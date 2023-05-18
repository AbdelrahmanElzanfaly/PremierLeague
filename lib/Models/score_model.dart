class Score {
  final String? winner;
  final String? duration;
  final ScoreTeam? fullTime;
  final ScoreTeam? halfTime;
  final ScoreTeam? extraTime;
  final ScoreTeam? penalties;

  Score({
    this.winner,
    this.duration,
    this.fullTime,
    this.halfTime,
    this.extraTime,
    this.penalties,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    winner: json["winner"],
    duration: json["duration"],
    fullTime: json["fullTime"] == null ? null : ScoreTeam.fromJson(json["fullTime"]),
    halfTime: json["halfTime"] == null ? null : ScoreTeam.fromJson(json["halfTime"]),
    extraTime: json["extraTime"] == null ? null : ScoreTeam.fromJson(json["extraTime"]),
    penalties: json["penalties"] == null ? null : ScoreTeam.fromJson(json["penalties"]),
  );

  Map<String, dynamic> toJson() => {
    "winner": winner,
    "duration": duration,
    "fullTime": fullTime?.toJson(),
    "halfTime": halfTime?.toJson(),
    "extraTime": extraTime?.toJson(),
    "penalties": penalties?.toJson(),
  };
}

class ScoreTeam {
  final int? homeTeam;
  final int? awayTeam;

  ScoreTeam({
    this.homeTeam,
    this.awayTeam,
  });

  factory ScoreTeam.fromJson(Map<String, dynamic> json) => ScoreTeam(
    homeTeam: json["homeTeam"],
    awayTeam: json["awayTeam"],
  );

  Map<String, dynamic> toJson() => {
    "homeTeam": homeTeam,
    "awayTeam": awayTeam,
  };
}
