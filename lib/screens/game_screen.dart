import 'dart:convert';

import 'package:basketball_app/components/games.dart';
import 'package:basketball_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GamesScreen createState() => _GamesScreen();
}

class _GamesScreen extends State<GamesScreen> {
  List gameList = [];
  void getGames() {
    DefaultAssetBundle.of(context)
        .loadString('assets/json/games.json')
        .then((value) {
      final data = jsonDecode(value);
      setState(() {
        gameList = data['data'];
      });
    });
  }

  // @override
  // void initState({
  //   required super.initState();
  //   getGames();
  // })

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Styles.blueColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          width: 350,
          height: 350,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: gameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return miniGameCard(
                        Games(
                          gameId: gameList[index]['id'],
                          gameDate: gameList[index]['date'],
                          homeTeamScore: gameList[index]['home_team_score'],
                          visitorTeamScore: gameList[index]
                              ['visitor_team_score'],
                          period: gameList[index]['period'],
                          status: gameList[index]['status'],
                          homeTeamAbbreviation: gameList[index]['home_team']
                              ['abbrevaition'],
                          visitorTeamAbbreviation: gameList[index]
                              ['visitor_team']['abbreviation'],
                        ),
                      );
                    }),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

Widget miniGameCard(Games games) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
    ),
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${games.homeTeamAbbreviation}',
              style: Styles.headLineStyle3.copyWith(color: Colors.white),
            ),
            Text(
              "VS",
              style: Styles.headLineStyle3.copyWith(color: Colors.black),
            ),
            Text(
              '${games.visitorTeamAbbreviation}',
              style: Styles.headLineStyle3.copyWith(color: Colors.black),
            )
          ],
        )
      ],
    ),
  );
}
