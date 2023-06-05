class Games {
  final int? gameId;
  final String? gameDate;
  final int? homeTeamScore;
  final int? visitorTeamScore;
  final int? period;
  final int? season;
  final String? status;
  final int? homeTeamId;
  final int? visitorTeamId;
  final String? homeTeamAbbreviation;
  final String? visitorTeamAbbreviation;

  const Games(
      {this.gameId,
      this.gameDate,
      this.homeTeamScore,
      this.visitorTeamScore,
      this.period,
      this.season,
      this.status,
      this.homeTeamId,
      this.visitorTeamId,
      this.homeTeamAbbreviation,
      this.visitorTeamAbbreviation});
}
