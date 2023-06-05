import 'package:basketball_app/screens/bottom_navigation.dart';
import 'package:basketball_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Basketball());
}

class Basketball extends StatelessWidget {
  const Basketball({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'M-Directory',
      theme: ThemeData(
        primaryColor: primary,
      ),
      // 4
      home: const BottomBar(),
    );
  }
}
