import 'package:flutter/material.dart';

void main() {
  runApp(App()); //App 위젯(클래스)을 실행. App 위젯이 root.
}

//stateless: 변경되지 않는 위젯
class App extends StatelessWidget {
  //App extends StatelessWidget > Widget build > return MaterialApp > home: Scaffold > body: ...
  //build 메소드를 구현하고,
  @override
  Widget build(BuildContext context) {
    //root 위젯은 material(Android), cupertino(iOS) 앱 둘 중 하나를 리턴해야 함.
    //family(default) 스타일 지정
    return MaterialApp(
      home: Scaffold(
        //앱의 메인화면
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Flutter Title",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic,
            ),
          ), //title이 위젯이라 Text 위젯으로 작성.
          shadowColor: Colors.yellow,
          backgroundColor: Colors.white,
          centerTitle: true, //centerTitle에 마우스를 올리면 타입이 Bool이라 나와서 ture, false로 작성.
          elevation: 10,
        ),
        body: const Center(
          child: Text('Hello Flutter!'),
        ), //Center 위젯은 child가 있고, child는 위젯이므로 Text 위젯으로 작성.
      ), //화면의 구성 및 구조에 관한 위젯(Top bar, body)
    );
  }
}
