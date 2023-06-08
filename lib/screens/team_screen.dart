import 'package:basketball_app/components/teams.dart';
import 'package:basketball_app/utils/app_data.dart';
import 'package:basketball_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  List<Teams> teamScreen = [];
  late Future<List<dynamic>> futureTeams;

  Future<List<dynamic>> fetchTeams() async {
    try {
      return await AppData.getTeams();
    } catch (e) {
      throw Exception('Failed to fetch teams: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    futureTeams = fetchTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: futureTeams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            teamScreen =
                snapshot.data!.map((bkteam) => Teams.teamObj(bkteam)).toList();
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
                      style:
                          Styles.headLineStyle4.copyWith(color: Colors.black45),
                    ),
                    trailing: Text(
                      teamScreen[index].division,
                      style: Styles.headLineStyle4,
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
                    style: TextStyle(color: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureTeams = fetchTeams();
                      });
                    },
                    child: Text('Retry'),
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
