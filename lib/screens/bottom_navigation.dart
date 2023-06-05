import 'package:basketball_app/screens/game_screen.dart';
import 'package:basketball_app/screens/players_screen.dart';
import 'package:basketball_app/screens/statistics_screen.dart';
import 'package:basketball_app/screens/team_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const PlayersScreen(),
    const GamesScreen(),
    const TeamScreen(),
    const StatisticsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // print('tapped index is ${_selectedIndex}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xFF3b3b3b)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(10),
            child: ClipOval(
              child: Image.asset("assets/images/me.jpg"),
            ),
          )
        ],
        title: const Image(
          // image needs to be removed background
          image: AssetImage("assets/images/ball.png"),
          width: 30,
          height: 30,
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: const Color(0xFFeeedf2),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 10,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xFF526799),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xFF526799),
          items: const [
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/icons/home.png"),
                width: 25,
                height: 25,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/icons/group_.png"),
                width: 25,
                height: 25,
              ),
              label: "Players",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/icons/sports_basketball_.png"),
                width: 25,
                height: 25,
              ),
              label: "Games",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/icons/groups_.png"),
                width: 25,
                height: 25,
              ),
              label: "Teams",
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/icons/monitoring_.png"),
                width: 25,
                height: 25,
              ),
              label: "Statistics",
            ),
          ],
        ),
      ),
    );
  }
}
