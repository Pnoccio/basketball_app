import 'dart:convert';
import 'package:basketball_app/components/games.dart';
import 'package:basketball_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  List<Games> gameList = [];
  late Future<List> futureGames;

  Future<List> getGames() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString('assets/json/games.json');
    final List data = jsonDecode(jsonData)['data'];
    return data.map((game) => Games.gamesObj(game)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureGames = getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: futureGames,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              gameList = snapshot.data as List<Games>;
              return ListView.builder(
                itemCount: gameList.length,
                itemBuilder: (context, index) {
                  final bkgame = gameList[index];
                  return Container(
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: ListTile(
                      leading: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            bkgame.status,
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            bkgame.gameDate.substring(0, 10),
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      title: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  bkgame.homeTeam.fullName,
                                  style: Styles.headLineStyle3
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  bkgame.visitorTeam.fullName,
                                  style: Styles.headLineStyle3
                                      .copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      trailing: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Text('${bkgame.homeTeamScore}'),
                          const SizedBox(
                            height: 1,
                          ),
                          Text('${bkgame.visitorTeamScore}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
