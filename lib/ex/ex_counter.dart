import 'package:flutter/material.dart';

//counter 기능을 통해 flutter에서 할 수 있는 것들을 배움.
//강의 내용 외에 카운터를 내리는 기능과 리셋을 추가.

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<int> nums = [];

  void counterUp() {
    setState(() {
      //변경된 것을 프레임워크에게 알려주는 역할(build 메소드).
      counter++; //setState가 없으면 앱을 수정할 때(Hot Reload) 때만 변경.
      nums.add(nums.length);
    });
  }

  void counterDown() {
    setState(() {
      counter--;
      if (nums.isNotEmpty) {
        //리스트가 빌 때 누르면 에러가 나와서 처리.
        nums.removeLast();
      }
    });
  }

  void counterReset() {
    setState(() {
      counter = 0;
      nums.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Click Count",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: counterUp, icon: const Icon(Icons.add_box_rounded)),
                  IconButton(onPressed: counterDown, icon: const Icon(Icons.indeterminate_check_box_rounded)),
                  IconButton(onPressed: counterReset, icon: const Icon(Icons.restore_outlined)),
                ],
              ), //경로의존성을 위한 배치
              for (var i in nums)
                Text(
                  '$i',
                  style: TextStyle(
                    fontSize: counter + 10,
                  ),
                ),
              // Text(
              //   "$counter",
              //   style: const TextStyle(
              //     fontSize: 50,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
