import 'package:flutter/material.dart';
import 'package:test/screens/home_screen.dart';

//COLOR
//red:   #E7626C
//bage:  #232B55
//white: #FFFFFE
//blue:  #F3EDDB
void main() {
  runApp(Pomodoro());
}

class Pomodoro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFE7626C),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF3EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}
