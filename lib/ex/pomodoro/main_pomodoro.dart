import 'package:flutter/material.dart';
import 'screens/home_screen_pomodoro.dart';

//뽀모도로 타이머를 만들어 봄.
//주요 기능은 pomodoro/screens/home_screen_pomodoro에 참조.

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
