import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff171717), //class const면 에러가 나옴.
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 50, //margin(?) 역할
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Hey, Luca",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 45,
                          // fontFamily: 'Lato',    //시험 삼아서 넣어본 구글 폰트.
                        ),
                      ),
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.end, //col을 오른쪽으로(col 메인: 상하, 크로스: 좌우)
                  ),
                  // SizedBox(
                  //   width: 10, //스스로 오른쪽 margin이 부족하다 여겨서 추가. 하지만 padding widget의 존재를 알고 수정
                  // ),
                ],
                mainAxisAlignment: MainAxisAlignment.end, //row를 오른쪽으로(row 메인: 좌우, 크로스: 상하)
              ),
              Row(
                children: [
                  TextButton(
                    child: Text('Connected'),
                    onPressed: () {
                      debugPrint('now connect!!');
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
