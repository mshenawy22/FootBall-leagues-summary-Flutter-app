// To parse this JSON data, do
//
//     final matchesHistory = matchesHistoryFromMap(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

class MatchesHistoryModel {
  MatchesHistoryModel({
    this.count,
    this.filters,
    this.competition,
    this.matches,
  });

  final int? count;
  final Filters? filters;
  final Competition? competition;
  final List<Match>? matches;

  MatchesHistoryModel copyWith({
    int? count,
    Filters? filters,
    Competition? competition,
    List<Match>? matches,
  }) =>
      MatchesHistoryModel(
        count: count ?? this.count,
        filters: filters ?? this.filters,
        competition: competition ?? this.competition,
        matches: matches ?? this.matches,
      );

  factory MatchesHistoryModel.fromJson(String str) => MatchesHistoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MatchesHistoryModel.fromMap(Map<String, dynamic> json) => MatchesHistoryModel(
    count: json["count"] == null ? null : json["count"],
    filters: json["filters"] == null ? null : Filters.fromMap(json["filters"]),
    competition: json["competition"] == null ? null : Competition.fromMap(json["competition"]),
    matches: json["matches"] == null ? null : List<Match>.from(json["matches"].map((x) => Match.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "count": count == null ? null : count,
    "filters": filters == null ? null : filters?.toMap(),
    "competition": competition == null ? null : competition?.toMap(),
    "matches": matches == null ? null : List<dynamic>.from(matches!.map((x) => x.toMap())),
  };
}

class Competition extends Equatable {
  Competition({
    required this.id,
    this.area,
    this.name,
    this.code,
    this.plan,
    this.lastUpdated,
  });

  final int id;
  final TeamBasicInfo? area;
  final String? name;
  final String? code;
  final String? plan;
  final DateTime? lastUpdated;

  Competition copyWith({
    int? id,
    TeamBasicInfo? area,
    String? name,
    String? code,
    String? plan,
    DateTime? lastUpdated,
  }) =>
      Competition(
        id: id ?? this.id,
        area: area ?? this.area,
        name: name ?? this.name,
        code: code ?? this.code,
        plan: plan ?? this.plan,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );

  factory Competition.fromJson(String str) => Competition.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Competition.fromMap(Map<String, dynamic> json) => Competition(
    id: json["id"] == null ? null : json["id"],
    area: json["area"] == null ? null : TeamBasicInfo.fromMap(json["area"]),
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    plan: json["plan"] == null ? null : json["plan"],
    lastUpdated: json["lastUpdated"] == null ? null : DateTime.parse(json["lastUpdated"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "area": area == null ? null : area?.toMap(),
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "plan": plan == null ? null : plan,
    "lastUpdated": lastUpdated == null ? null : lastUpdated?.toIso8601String(),
  };

  @override
  // TODO: implement props
  List<Object?> get props => [this.id, this.name, this.area , this.code , this.plan , this.lastUpdated];
}

class TeamBasicInfo extends Equatable {
  TeamBasicInfo({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  TeamBasicInfo copyWith({
    int? id,
    String? name,
  }) =>
      TeamBasicInfo(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory TeamBasicInfo.fromJson(String str) => TeamBasicInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeamBasicInfo.fromMap(Map<String, dynamic> json) => TeamBasicInfo(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [this.id];
}

class Filters {
  Filters({
    this.status,
  });

  final List<Status>? status;

  Filters copyWith({
    List<Status>? status,
  }) =>
      Filters(
        status: status ?? this.status,
      );

  factory Filters.fromJson(String str) => Filters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Filters.fromMap(Map<String, dynamic> json) => Filters(
    status: json["status"] == null ? null : List<Status>.from(json["status"].map((x) => statusValues.map[x])),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : List<dynamic>.from(status!.map((x) => statusValues.reverse[x])),
  };
}

enum Status { FINISHED }

final statusValues = EnumValues({
  "FINISHED": Status.FINISHED
});

class Match {
  Match({
    required this.id,
    this.season,
    this.utcDate,
    this.status,
    this.matchday,
    this.stage,
    this.group,
    this.lastUpdated,
    this.odds,
    this.score,
    this.homeTeam,
    this.awayTeam,
    this.referees,
  });

  final int id;
  final Season? season;
  final DateTime? utcDate;
  final Status? status;
  final int? matchday;
  final Stage? stage;
  final dynamic group;
  final DateTime? lastUpdated;
  final Odds? odds;
  final Score? score;
  final TeamBasicInfo? homeTeam;
  final TeamBasicInfo? awayTeam;
  final List<Referee>? referees;

  Match copyWith({
    int? id,
    Season? season,
    DateTime? utcDate,
    Status? status,
    int? matchday,
    Stage? stage,
    dynamic group,
    DateTime? lastUpdated,
    Odds? odds,
    Score? score,
    TeamBasicInfo? homeTeam,
    TeamBasicInfo? awayTeam,
    List<Referee>? referees,
  }) =>
      Match(
        id: id ?? this.id,
        season: season ?? this.season,
        utcDate: utcDate ?? this.utcDate,
        status: status ?? this.status,
        matchday: matchday ?? this.matchday,
        stage: stage ?? this.stage,
        group: group ?? this.group,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        odds: odds ?? this.odds,
        score: score ?? this.score,
        homeTeam: homeTeam ?? this.homeTeam,
        awayTeam: awayTeam ?? this.awayTeam,
        referees: referees ?? this.referees,
      );

  factory Match.fromJson(String str) => Match.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Match.fromMap(Map<String, dynamic> json) => Match(
    id: json["id"] == null ? null : json["id"],
    season: json["season"] == null ? null : Season.fromMap(json["season"]),
    utcDate: json["utcDate"] == null ? null : DateTime.parse(json["utcDate"]),
    status: json["status"] == null ? null : statusValues.map[json["status"]],
    matchday: json["matchday"] == null ? null : json["matchday"],
    stage: json["stage"] == null ? null : stageValues.map[json["stage"]],
    group: json["group"],
    lastUpdated: json["lastUpdated"] == null ? null : DateTime.parse(json["lastUpdated"]),
    odds: json["odds"] == null ? null : Odds.fromMap(json["odds"]),
    score: json["score"] == null ? null : Score.fromMap(json["score"]),
    homeTeam: json["homeTeam"] == null ? null : TeamBasicInfo.fromMap(json["homeTeam"]),
    awayTeam: json["awayTeam"] == null ? null : TeamBasicInfo.fromMap(json["awayTeam"]),
    referees: json["referees"] == null ? null : List<Referee>.from(json["referees"].map((x) => Referee.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "season": season == null ? null : season?.toMap(),
    "utcDate": utcDate == null ? null : utcDate?.toIso8601String(),
    "status": status == null ? null : statusValues.reverse[status],
    "matchday": matchday == null ? null : matchday,
    "stage": stage == null ? null : stageValues.reverse[stage],
    "group": group,
    "lastUpdated": lastUpdated == null ? null : lastUpdated?.toIso8601String(),
    "odds": odds == null ? null : odds?.toMap(),
    "score": score == null ? null : score?.toMap(),
    "homeTeam": homeTeam == null ? null : homeTeam?.toMap(),
    "awayTeam": awayTeam == null ? null : awayTeam?.toMap(),
    "referees": referees == null ? null : List<dynamic>.from(referees!.map((x) => x.toMap())),
  };
}

class Odds {
  Odds({
    this.msg,
  });

  final Msg? msg;

  Odds copyWith({
    Msg? msg,
  }) =>
      Odds(
        msg: msg ?? this.msg,
      );

  factory Odds.fromJson(String str) => Odds.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Odds.fromMap(Map<String, dynamic> json) => Odds(
    msg: json["msg"] == null ? null : msgValues.map[json["msg"]],
  );

  Map<String, dynamic> toMap() => {
    "msg": msg == null ? null : msgValues.reverse[msg],
  };
}

enum Msg { ACTIVATE_ODDS_PACKAGE_IN_USER_PANEL_TO_RETRIEVE_ODDS }

final msgValues = EnumValues({
  "Activate Odds-Package in User-Panel to retrieve odds.": Msg.ACTIVATE_ODDS_PACKAGE_IN_USER_PANEL_TO_RETRIEVE_ODDS
});

class Referee {
  Referee({
    required this.id,
    this.name,
    this.role,
    this.nationality,
  });

  final int id;
  final String? name;
  final Role? role;
  final Nationality? nationality;

  Referee copyWith({
    int? id,
    String? name,
    Role? role,
    Nationality? nationality,
  }) =>
      Referee(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
        nationality: nationality ?? this.nationality,
      );

  factory Referee.fromJson(String str) => Referee.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Referee.fromMap(Map<String, dynamic> json) => Referee(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    role: json["role"] == null ? null : roleValues.map[json["role"]],
    nationality: json["nationality"] == null ? null : nationalityValues.map[json["nationality"]],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "role": role == null ? null : roleValues.reverse[role],
    "nationality": nationality == null ? null : nationalityValues.reverse[nationality],
  };
}

enum Nationality { GERMANY }

final nationalityValues = EnumValues({
  "Germany": Nationality.GERMANY
});

enum Role { REFEREE, ASSISTANT_REFEREE_N1, ASSISTANT_REFEREE_N2, FOURTH_OFFICIAL, VIDEO_ASSISANT_REFEREE_N1, VIDEO_ASSISANT_REFEREE_N2 }

final roleValues = EnumValues({
  "ASSISTANT_REFEREE_N1": Role.ASSISTANT_REFEREE_N1,
  "ASSISTANT_REFEREE_N2": Role.ASSISTANT_REFEREE_N2,
  "FOURTH_OFFICIAL": Role.FOURTH_OFFICIAL,
  "REFEREE": Role.REFEREE,
  "VIDEO_ASSISANT_REFEREE_N1": Role.VIDEO_ASSISANT_REFEREE_N1,
  "VIDEO_ASSISANT_REFEREE_N2": Role.VIDEO_ASSISANT_REFEREE_N2
});

class Score {
  Score({
    this.winner,
    this.duration,
    this.fullTime,
    this.halfTime,
    this.extraTime,
    this.penalties,
  });

  final Winner? winner;
  final Duration? duration;
  final ExtraTime? fullTime;
  final ExtraTime? halfTime;
  final ExtraTime? extraTime;
  final ExtraTime? penalties;

  Score copyWith({
    Winner? winner,
    Duration? duration,
    ExtraTime? fullTime,
    ExtraTime? halfTime,
    ExtraTime? extraTime,
    ExtraTime? penalties,
  }) =>
      Score(
        winner: winner ?? this.winner,
        duration: duration ?? this.duration,
        fullTime: fullTime ?? this.fullTime,
        halfTime: halfTime ?? this.halfTime,
        extraTime: extraTime ?? this.extraTime,
        penalties: penalties ?? this.penalties,
      );

  factory Score.fromJson(String str) => Score.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Score.fromMap(Map<String, dynamic> json) => Score(
    winner: json["winner"] == null ? null : winnerValues.map[json["winner"]],
    duration: json["duration"] == null ? null : durationValues.map[json["duration"]],
    fullTime: json["fullTime"] == null ? null : ExtraTime.fromMap(json["fullTime"]),
    halfTime: json["halfTime"] == null ? null : ExtraTime.fromMap(json["halfTime"]),
    extraTime: json["extraTime"] == null ? null : ExtraTime.fromMap(json["extraTime"]),
    penalties: json["penalties"] == null ? null : ExtraTime.fromMap(json["penalties"]),
  );

  Map<String, dynamic> toMap() => {
    "winner": winner == null ? null : winnerValues.reverse[winner],
    "duration": duration == null ? null : durationValues.reverse[duration],
    "fullTime": fullTime == null ? null : fullTime?.toMap(),
    "halfTime": halfTime == null ? null : halfTime?.toMap(),
    "extraTime": extraTime == null ? null : extraTime?.toMap(),
    "penalties": penalties == null ? null : penalties?.toMap(),
  };
}

enum Duration { REGULAR }

final durationValues = EnumValues({
  "REGULAR": Duration.REGULAR
});

class ExtraTime {
  ExtraTime({
    this.homeTeam,
    this.awayTeam,
  });

  final int? homeTeam;
  final int? awayTeam;

  ExtraTime copyWith({
    int? homeTeam,
    int? awayTeam,
  }) =>
      ExtraTime(
        homeTeam: homeTeam ?? this.homeTeam,
        awayTeam: awayTeam ?? this.awayTeam,
      );

  factory ExtraTime.fromJson(String str) => ExtraTime.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExtraTime.fromMap(Map<String, dynamic> json) => ExtraTime(
    homeTeam: json["homeTeam"] == null ? null : json["homeTeam"],
    awayTeam: json["awayTeam"] == null ? null : json["awayTeam"],
  );

  Map<String, dynamic> toMap() => {
    "homeTeam": homeTeam == null ? null : homeTeam,
    "awayTeam": awayTeam == null ? null : awayTeam,
  };
}

enum Winner { AWAY_TEAM, HOME_TEAM, DRAW }

final winnerValues = EnumValues({
  "AWAY_TEAM": Winner.AWAY_TEAM,
  "DRAW": Winner.DRAW,
  "HOME_TEAM": Winner.HOME_TEAM
});

class Season {
  Season({
    this.id,
    this.startDate,
    this.endDate,
    this.currentMatchday,
  });

  final int? id;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? currentMatchday;

  Season copyWith({
    required int id,
    DateTime? startDate,
    DateTime? endDate,
    int? currentMatchday,
  }) =>
      Season(
        id: id,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        currentMatchday: currentMatchday ?? this.currentMatchday,
      );

  factory Season.fromJson(String str) => Season.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Season.fromMap(Map<String, dynamic> json) => Season(
    id: json["id"] == null ? null : json["id"],
    startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
    endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    currentMatchday: json["currentMatchday"] == null ? null : json["currentMatchday"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "startDate": startDate == null ? null : "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
    "endDate": endDate == null ? null : "${endDate?.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate?.day.toString().padLeft(2, '0')}",
    "currentMatchday": currentMatchday == null ? null : currentMatchday,
  };
}

enum Stage { REGULAR_SEASON }

final stageValues = EnumValues({
  "REGULAR_SEASON": Stage.REGULAR_SEASON
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
