import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSecond = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer; //지금 초기화할 필요는 없지만 사용할 때는 꼭 초기화해야 함

  void onTick(Timer timer) {
    if (totalSecond == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        totalSecond = twentyFiveMinutes;
        isRunning = false;
        Vibration.vibrate(duration: 1000); //타이머가 끝나면 진동 울리기.
        timer.cancel();
      });
    } else {
      setState(() {
        totalSecond = totalSecond - 1;
      });
    }
  }

  void onStartPressed() {
    //매초마다 onTick 함수 실행
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    //매초마다 onTick 함수 실행
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressd() {
    setState(() {
      timer.cancel();
      isRunning = false;
      totalPomodoros = 0;
      totalSecond = twentyFiveMinutes;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            //화면 크기에 따른 유연한 크기를 보장.
            //flex의 기본은 1이며, 크기는 this_flex/all_flex가 된다.
            //Flexible과 Expended는 꼭 Col/Row 안에서 사용할 것.
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSecond),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 90,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Vibration.vibrate(duration: 30); //
                      // isRunning == false ? onStartPressed() : onPausePressed();
                      // HapticFeedback.heavyImpact();
                      HapticFeedback.heavyImpact(); //버튼 클릭마다 터치 피드백
                      isRunning ? onPausePressed() : onStartPressed();
                    },
                    icon: Icon(isRunning ? Icons.pause_circle_outline_outlined : Icons.play_circle_outline),
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                  ),
                  IconButton(
                    onPressed: () {
                      HapticFeedback.heavyImpact(); //버튼 클릭마다 터치 피드백
                      onResetPressd();
                    },
                    icon: const Icon(Icons.restore),
                    iconSize: 70,
                    color: Theme.of(context).cardColor,
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  //확장 위젯
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      // borderRadius: const BorderRadius.only(
                      //   //사용 중인 폰의 화면 특성상 all은 예쁘지 않아서 only top으로 사용
                      //   topLeft: Radius.circular(10),
                      //   topRight: Radius.circular(30),
                      //   bottomLeft: Radius.circular(10),
                      // ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 40,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                        Text(
                          "$totalPomodoros",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 60,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
