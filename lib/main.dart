import 'package:flutter/material.dart';
import 'package:test/widgets/button.dart';
import 'package:test/widgets/card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818), //class const면 에러가 나옴.
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50, //margin(?) 역할
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, //row를 오른쪽으로(row 메인: 좌우, 크로스: 상하)
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end, //col을 오른쪽으로(col 메인: 상하, 크로스: 좌우)
                    children: const [
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
                  ),
                  // SizedBox(
                  //   width: 10, //스스로 오른쪽 margin이 부족하다 여겨서 추가. 하지만 padding widget의 존재를 알고 수정
                  // ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Total Balance",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 25,
                ),
              ),
              const Text(
                "\$5,194,382",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(
                    text: "Transfer",
                    bgColor: Color(0xfff2b33a),
                  ),
                  Button(
                    text: "Request",
                    bgColor: Color(0xff1f2123),
                    textColor: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Wallets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CurrencyCard(
                currencyName: "Euro",
                cardColor: CardColor.black,
                icon: Icons.euro,
                moneyAmount: "6,428",
                currencyInitial: "ERU",
                order: 0,
              ),
              const CurrencyCard(
                currencyName: "Dollar",
                cardColor: CardColor.white,
                icon: Icons.attach_money,
                moneyAmount: "12,403",
                currencyInitial: "USD",
                order: 1,
              ),
              const CurrencyCard(
                currencyName: "Bitcoin",
                cardColor: CardColor.black,
                icon: Icons.currency_bitcoin,
                moneyAmount: "0.000423",
                currencyInitial: "BTC",
                order: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
