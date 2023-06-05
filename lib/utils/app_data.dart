import 'dart:convert';

import 'package:flutter/services.dart';

class AppData {
  static String playersJson = 'assets/json/players.json';
  static String gamesJson = 'assets/json/games.json';
  static String teamsJson = 'assets/json/teams.json';
  static String statsJson = 'assets/json/stata.json';

  static Future<List> getPlayers() async {
    final String response = await rootBundle.loadString(playersJson);
    final List data = await jsonDecode(response)['data'];
    return data;
  }

  static Future<List> getTeams() async {
    final String response = await rootBundle.loadString(teamsJson);
    final List data = await jsonDecode(response)['data'];
    return data;
  }

  static Future<List> getGames() async {
    final String response = await rootBundle.loadString(gamesJson);
    final List data = await jsonDecode(response)['data'];
    return data;
  }

  static Future<List> getStats() async {
    final String response = await rootBundle.loadString(statsJson);
    final List data = await jsonDecode(response)['data'];
    return data;
  }
}
