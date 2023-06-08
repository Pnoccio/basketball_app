import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class AppData {
  static Future<List<dynamic>> getPlayers() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/players'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception('Failed to fetch players');
    }
  }

  static Future<List<dynamic>> getTeams() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/teams'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception('Failed to fetch teams');
    }
  }

  static Future<List<dynamic>> getGames() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/games'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data;
    } else {
      throw Exception('Failed to fetch games');
    }
  }
}

  // static String playersJson = 'assets/json/players.json';
  // static String gamesJson = 'assets/json/games.json';
  // static String teamsJson = 'assets/json/teams.json';
  // static String statsJson = 'assets/json/stata.json';

  // static Future<List> getPlayers() async {
  //   final String response = await rootBundle.loadString(playersJson);
  //   final List data = await jsonDecode(response)['data'];
  //   return data;
  // }

  // static Future<List> getTeams() async {
  //   final String response = await rootBundle.loadString(teamsJson);
  //   final List data = await jsonDecode(response)['data'];
  //   return data;
  // }

  // static Future<List> getGames() async {
  //   final String response = await rootBundle.loadString(gamesJson);
  //   final List data = await jsonDecode(response)['data'];
  //   return data;
  // }

  // static Future<List> getStats() async {
  //   final String response = await rootBundle.loadString(statsJson);
  //   final List data = await jsonDecode(response)['data'];
  //   return data;
  // }
//}




