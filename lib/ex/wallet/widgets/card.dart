import 'package:flutter/material.dart';

//button.dart를 토대로 직접 만들어 본 card.dart
//좀 더 많은 옵션을 넣어 작성에 편의성을 높이려고 함.
//아래 주석을 참조.

enum CardColor { black, white }

class CurrencyCard extends StatelessWidget {
  final String currencyName;
  final Enum cardColor;
  final IconData icon;
  final String moneyAmount;
  final String currencyInitial;
  final int order;

  const CurrencyCard({
    super.key,
    required this.currencyName,
    required this.cardColor,
    required this.icon,
    required this.moneyAmount,
    required this.currencyInitial,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    Color baseColor;
    Color subColor;
    if (cardColor == CardColor.black) {
      baseColor = const Color(0xff1f2123);
      subColor = Colors.white;
    } else {
      baseColor = Colors.white;
      subColor = const Color(0xff1f2123);
    }
    return Transform.translate(
      offset: Offset(0, -(order.toDouble() * 20)),
      child: Container(
        clipBehavior: Clip.hardEdge, //container 밖으로 나온 부분을 컷.
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currencyName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: subColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        moneyAmount,
                        style: TextStyle(
                          color: subColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        currencyInitial,
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                //위치를 조정한 아이콘의 크기를 조정
                //scale과 translate 순서를 바꿔도 무관
                scale: 2,
                child: Transform.translate(
                  offset: const Offset(-10, 15),
                  child: Icon(
                    icon,
                    color: subColor,
                    size: 80,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
