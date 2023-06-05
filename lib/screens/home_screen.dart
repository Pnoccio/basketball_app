import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_styles.dart';
import '../components/team_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(4),

                Row(
                  children: [
                    Text(
                      "Welcome to our BasketBall Livescore",
                      style: Styles.headLineStyle3,
                      textAlign: TextAlign.center,
                    ),
                    // image placement here
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // image: const DecorationImage(
                        // fit: BoxFit.cover,
                        // image: AssetImage(),
                      ),
                    ),
                  ],
                ),
                // search input
                const Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6ff),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular,
                          color: Color(0xFFBFC205)),
                      Text(
                        "Search",
                        style: Styles.headLineStyle4,
                      ),
                    ],
                  ),
                ),
                const Gap(40),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Upcoming Games", style: Styles.headLineStyle2),
                //     InkWell(
                //       child: Text("View all", style: Styles.textStyle),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
          const Gap(5),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                TeamCards(),
              ],
            ),
          ),
          const Gap(10),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text("Teams", style: Styles.headLineStyle2),
          //       InkWell(
          //         child: Text("View all", style: Styles.textStyle),
          //       )
          //     ],
          //   ),
          // ),
          const Gap(15),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                // TeamView(),
                // TeamView(),
                // TeamView(),
                // TeamView(),
                // TeamView(),
                // TeamView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
