class FootBallResponse {
  Api? api;

  FootBallResponse({this.api});

  FootBallResponse.fromJson(Map<String, dynamic> json) {
    api = json['api'] != null ? Api.fromJson(json['api']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (api != null) {
      data['api'] = api!.toJson();
    }
    return data;
  }
}

class Api {
  int? results;
  List<Fixtures>? fixtures;

  Api({this.results, this.fixtures});

  Api.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    if (json['fixtures'] != null) {
      fixtures = <Fixtures>[];
      json['fixtures'].forEach((v) {
        fixtures!.add(Fixtures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    if (fixtures != null) {
      data['fixtures'] = fixtures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fixtures {
  int? fixtureId;
  int? leagueId;
  League? league;
  String? eventDate;
  int? eventTimestamp;
  int? firstHalfStart;
  int? secondHalfStart;
  String? round;
  String? status;
  String? statusShort;
  int? elapsed;
  String? venue;
  String? referee;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  int? goalsHomeTeam;
  int? goalsAwayTeam;
  Score? score;

  Fixtures(
      {this.fixtureId,
      this.leagueId,
      this.league,
      this.eventDate,
      this.eventTimestamp,
      this.firstHalfStart,
      this.secondHalfStart,
      this.round,
      this.status,
      this.statusShort,
      this.elapsed,
      this.venue,
      this.referee,
      this.homeTeam,
      this.awayTeam,
      this.goalsHomeTeam,
      this.goalsAwayTeam,
      this.score});

  Fixtures.fromJson(Map<String, dynamic> json) {
    fixtureId = json['fixture_id'];
    leagueId = json['league_id'];
    league = json['league'] != null ? League.fromJson(json['league']) : null;
    eventDate = json['event_date'];
    eventTimestamp = json['event_timestamp'];
    firstHalfStart = json['firstHalfStart'];
    secondHalfStart = json['secondHalfStart'];
    round = json['round'];
    status = json['status'];
    statusShort = json['statusShort'];
    elapsed = json['elapsed'];
    venue = json['venue'];
    referee = json['referee'];
    homeTeam = json['homeTeam'] != null ? HomeTeam.fromJson(json['homeTeam']) : null;
    awayTeam = json['awayTeam'] != null ? HomeTeam.fromJson(json['awayTeam']) : null;
    goalsHomeTeam = json['goalsHomeTeam'];
    goalsAwayTeam = json['goalsAwayTeam'];
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fixture_id'] = fixtureId;
    data['league_id'] = leagueId;
    if (league != null) {
      data['league'] = league!.toJson();
    }
    data['event_date'] = eventDate;
    data['event_timestamp'] = eventTimestamp;
    data['firstHalfStart'] = firstHalfStart;
    data['secondHalfStart'] = secondHalfStart;
    data['round'] = round;
    data['status'] = status;
    data['statusShort'] = statusShort;
    data['elapsed'] = elapsed;
    data['venue'] = venue;
    data['referee'] = referee;
    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }
    data['goalsHomeTeam'] = goalsHomeTeam;
    data['goalsAwayTeam'] = goalsAwayTeam;
    if (score != null) {
      data['score'] = score!.toJson();
    }
    return data;
  }
}

class League {
  String? name;
  String? country;
  String? logo;
  String? flag;

  League({this.name, this.country, this.logo, this.flag});

  League.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['country'] = country;
    data['logo'] = logo;
    data['flag'] = flag;
    return data;
  }
}

class HomeTeam {
  int? teamId;
  String? teamName;
  String? logo;

  HomeTeam({this.teamId, this.teamName, this.logo});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    teamName = json['team_name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['team_id'] = teamId;
    data['team_name'] = teamName;
    data['logo'] = logo;
    return data;
  }
}

class Score {
  String? halftime;
  String? fulltime;
  String? extratime;
  String? penalty;

  Score({this.halftime, this.fulltime, this.extratime, this.penalty});

  Score.fromJson(Map<String, dynamic> json) {
    halftime = json['halftime'];
    fulltime = json['fulltime'];
    extratime = json['extratime'];
    penalty = json['penalty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['halftime'] = halftime;
    data['fulltime'] = fulltime;
    data['extratime'] = extratime;
    data['penalty'] = penalty;
    return data;
  }
}
