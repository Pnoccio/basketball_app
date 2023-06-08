import 'package:basketball_app/components/teams.dart';
import 'package:basketball_app/utils/app_data.dart';
import 'package:basketball_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  void initState() {
    super.initState();
    getTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: futureTeams,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: teamScreen.length,
                  itemBuilder: (context, index) {
                    String teamImages =
                        'assets/team_logos/team_photo_${index + 1}.png';
                    return Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Styles.bgColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: ListTile(
                        leading: Container(
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(10),
                          child: ClipOval(
                            child: Image.asset(
                              teamImages,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        title: Text(
                          teamScreen[index].fullName,
                          style: Styles.headLineStyle3.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          teamScreen[index].abbreviation,
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.black45),
                        ),
                        trailing: Text(
                          teamScreen[index].division,
                          style: Styles.headLineStyle4,
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: Text("Data is not found"),
              );
            }
          }),
    );
  }
}
