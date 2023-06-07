// import 'dart:convert';

// import 'package:basketball_app/models/players.dart';
// import 'package:basketball_app/utils/app_styles.dart';
import 'package:basketball_app/models/players.dart';
import 'package:basketball_app/utils/app_data.dart';
import 'package:basketball_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  PlayerScreenState createState() => PlayerScreenState();
}

class PlayerScreenState extends State<PlayersScreen> {
  List<Players> playerList = [];
  late Future<List> futurePlayers;

  void getPlayers() {
    futurePlayers = AppData.getPlayers();
    setState(() {
      futurePlayers.then((data) {
        playerList =
            data.map((bkplayer) => Players.playerObj(bkplayer)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: futurePlayers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: playerList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: ListTile(
                      title: Text(
                        '${playerList[index].firstName} ${playerList[index].lastName}',
                        style:
                            Styles.headLineStyle3.copyWith(color: Colors.black),
                      ),
                      subtitle: Text(
                        playerList[index].team.toString(),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text("Data is not Found"),
              );
            }
          }),
    );
  }
}
