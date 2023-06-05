// import 'dart:convert';

// import 'package:basketball_app/models/players.dart';
// import 'package:basketball_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
//   // ignore: library_private_types_in_public_api
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayersScreen> {
//   Future<List<Players>> getPlayersfromApi() async {
//     List<Players> playersScreen = [];
//     var response =
//         await http.get(Uri.https('balldontlie.io', 'api/v1/players'));
//     List jsonData = jsonDecode(response.body)['data'];
//     playersScreen = jsonData.map((player) => Players.toJson(player)).toList();
//     // for (var eachTeam in jsonData['data']) {
//     //   final player = Players(
//     //     firstName: eachTeam['first_name'],
//     //     lastName: eachTeam['last_name'],
//     //     position: eachTeam['position'],
//     //     team: '',
//     //   );

//     //   playersScreen.add(player);
//     // }

//     // print(playersScreen.length);
//     return playersScreen;
//   }

  @override
  Widget build(BuildContext context) {
//     getPlayersfromApi();
    return Scaffold(
//       body: FutureBuilder<List<Players>>(
//           future: getPlayersfromApi(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: ListTile(
//                         title: Text(
//                           '${snapshot.data![index].firstName} ${snapshot.data![index].lastName}',
//                           style: Styles.headLineStyle3
//                               .copyWith(color: Colors.black),
//                         ),
//                         subtitle:
//                             Text('Team - ${snapshot.data![index].team.name}'),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
        );
  }
}
