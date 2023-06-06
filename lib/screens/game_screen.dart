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
  List<Games> gameList = [];
  Widget? stats;
  final verticalSpace = const SizedBox(
    height: 5.0,
  );
  final horizontalSpace = const SizedBox(
    width: 2.0,
  );
  void getGames() {
    DefaultAssetBundle.of(context)
        .loadString('assets/json/games.json')
        .then((value) {
      final List data = jsonDecode(value)['data'];
      setState(() {
        gameList = data.map((game) => Games.gamesObj(game)).toList();
      });
    });
  }

  void changeGameStats(game) {
    setState(() {
      stats = gameStats(game);
    });
  }

  @override
  void initState() {
    super.initState();
    getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Styles.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: gameList.length,
              itemBuilder: (context, index) {
                return GameCard(
                  Games(
                    gameId: gameList[index].gameId,
                    gameDate: gameList[index].gameDate,
                    homeTeamScore: gameList[index].homeTeamScore,
                    visitorTeamScore: gameList[index].visitorTeamScore,
                    period: gameList[index].period,
                    status: gameList[index].status,
                    homeTeam: gameList[index].homeTeam,
                    visitorTeam: gameList[index].visitorTeam,
                    season: gameList[index].season,
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(5),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 200.0,
              ),
              decoration: BoxDecoration(
                color: Styles.bgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Game Status',
                    style: Styles.headLineStyle4.copyWith(color: Colors.black),
                  ),
                  verticalSpace,
                  // const DottedLine(
                  //   dashLength: 10,
                  //   dahsColor: Colors.black,
                  //   lineThickness: 1.0,
                  // ),
                  verticalSpace,
                  Expanded(
                    child: Center(
                      child: stats,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? gameStats(Games game) {
    return Column(
      children: [
        Text(
          'Year : ${game.season.toString()}',
          style: Styles.headLineStyle3.copyWith(color: Colors.black),
        ),
        Text(
          'status : ${game.status}',
          style: Styles.headLineStyle3.copyWith(color: Colors.black),
        ),
        verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(game.homeTeamScore.toString()),
            Text(
              'score',
              style: Styles.headLineStyle4.copyWith(color: Colors.black),
            ),
            Text(
              game.visitorTeamScore.toString(),
            ),
          ],
        ),
      ],
    );
  }
}

Widget GameCard(Games games) {
  return Container(
    margin: const EdgeInsets.only(right: 5.0, left: 5.0, top: 10.0),
    padding: const EdgeInsets.all(5),
    constraints: const BoxConstraints(
      maxWidth: 400,
      maxHeight: 200,
    ),
    decoration: BoxDecoration(
      color: Styles.bgColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              games.homeTeam.fullName,
              style: Styles.headLineStyle3.copyWith(color: Colors.black),
            ),
            Text(
              "VS",
              style: Styles.headLineStyle3.copyWith(color: Colors.black),
            ),
            Text(
              games.visitorTeam.fullName,
              style: Styles.headLineStyle3.copyWith(color: Colors.black),
            ),
          ],
        )
      ],
    ),
  );
}
