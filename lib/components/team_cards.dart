// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:m_directory/utils/app_styles.dart';

class TeamCards extends StatelessWidget {
  const TeamCards({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/players.jpg"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
            ),
            // todo: Add container, column, icon and text
            Container(
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.sports_basketball,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'NBA Basketball Teams',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            // todo: add center widget with chip widget children
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  Chip(
                    label: const Text(
                      'Lakers',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    onDeleted: () {
                      if (kDebugMode) {
                        print('delete');
                      }
                    },
                  ),
                  Chip(
                    label: const Text(
                      'Golden State Warriors',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    onDeleted: () {
                      if (kDebugMode) {
                        print('delete');
                      }
                    },
                  ),
                  Chip(
                    label: const Text(
                      'Miami Heats',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    onDeleted: () {
                      if (kDebugMode) {
                        print('delete');
                      }
                    },
                  ),
                  Chip(
                    label: const Text(
                      'Cleveland Cavaliers',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    onDeleted: () {
                      if (kDebugMode) {
                        print('delete');
                      }
                    },
                  ),
                  Chip(
                    label: const Text(
                      'Phoenix Suns',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    onDeleted: () {
                      if (kDebugMode) {
                        print('delete');
                      }
                    },
                  ),
                  Chip(
                    label: const Text(
                      'Boston Celtics',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    onDeleted: () {
                      if (kDebugMode) {
                        print('delete');
                      }
                    },
                  ),
                  Chip(
                    label: const Text(
                      'Milwaukee Bucks',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    onDeleted: () {
                      if (kDebugMode) {
                        print('delete');
                      }
                    },
                  ),
                  Chip(
                    label: const Text(
                      'Atalanta Hawks',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.2),
                    onDeleted: () {
                      if (kDebugMode) {
                        print('delete');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
