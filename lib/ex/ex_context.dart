import 'package:flutter/material.dart';

//Theme를 이용해 context의 역할을 배움.
//하단에 주석 참조.

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    //buildContext = 위젯 트리에서 위젯의 위치를
    //다루는 것
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 40,
              ),
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 50,
        color: Theme.of(context).textTheme.titleLarge!.color, //null safety
        //MaterialApp에서 작성한 textTheme를 context로 가져오는 것.
        //Theme.of(context)는 context 이름을 가진 가장 가까운 Theme를 탐색하는데
        //html 파싱하는 것 같은 모양새.
      ),
    );
  }
}
