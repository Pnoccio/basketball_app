// import 'dart:convert';

import 'dart:convert';

// import 'package:basketball_app/components/teams.dart';
// import 'package:basketball_app/utils/app_styles.dart';
// import 'package:basketball_app/utils/app_styles.dart';
import 'package:basketball_app/components/teams.dart';
import 'package:basketball_app/utils/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<Teams> teamScreen = [];
  late Future<List> futureTeams;
  void getTeams() async {
    futureTeams = AppData.getTeams();
    setState(() {
      futureTeams.then((data) {
        teamScreen = data.map((bkteam) => Teams.teamObj(bkteam)).toList();
      });
    });
    @override
    void initState() {
      super.initState();
      getTeams();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
