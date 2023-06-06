import 'package:basketball_app/components/teams.dart';

class Games {
  final int gameId;
  final String gameDate;
  final int homeTeamScore;
  final int visitorTeamScore;
  final int period;
  final int season;
  final String status;
  final Teams homeTeam;
  final Teams visitorTeam;

  const Games({
    required this.gameId,
    required this.gameDate,
    required this.homeTeamScore,
    required this.visitorTeamScore,
    required this.period,
    required this.season,
    required this.status,
    required this.homeTeam,
    required this.visitorTeam,
  });

  factory Games.gamesObj(Map<String, dynamic> json) {
    return Games(
      gameId: json['id'],
      gameDate: json['date'],
      homeTeamScore: json['home_team_score'],
      visitorTeamScore: json['visitor_team_score'],
      period: json['period'],
      season: json['season'],
      status: json['status'],
      homeTeam: Teams.teamObj(json['home_team']),
      visitorTeam: Teams.teamObj(json['visitor_team']),
    );
  }
}
