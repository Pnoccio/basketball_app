import 'package:basketball_app/components/games.dart';
import 'package:basketball_app/utils/app_data.dart';
import 'package:basketball_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GamesScreenState createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  List<Games> gameList = [];
  late Future<List<dynamic>> futureGames;

  Future<List> fetchGames() async {
    try {
      return await AppData.getGames();
    } catch (networkError) {
      throw Exception("Failed to fetch games: $networkError");
    }
    // String jsonData = await DefaultAssetBundle.of(context)
    //     .loadString('assets/json/games.json');
    // final List data = jsonDecode(jsonData)['data'];
    // return data.map((game) => Games.gamesObj(game)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureGames = fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: futureGames,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            gameList =
                snapshot.data!.map((game) => Games.gamesObj(game)).toList();
            return ListView.builder(
              itemCount: gameList.length,
              itemBuilder: (context, index) {
                final bkgame = gameList[index];
                return Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(2),
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
                                style: Styles.headLineStyle3.copyWith(
                                  color: Colors.black,
                                ),
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
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureGames = fetchGames();
                      });
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return const Text('No data found');
          }
        },
      ),
    );
  }
}
