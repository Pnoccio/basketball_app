import 'package:basketball_app/components/teams.dart';

class Players {
  final String firstName;
  final String lastName;
  final String position;
  final Teams team;

  const Players({
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.team,
  });

  factory Players.toJson(Map<String, dynamic> json) {
    return Players(
        firstName: json['first_name'],
        lastName: json['last_name'],
        position: json['position'],
        team: Teams.fromJson(json['team']));
  }
}
