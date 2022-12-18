import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color? textColor;
  //create constructer↓

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    this.textColor, //Transfer는 기본색(블랙)이라 필요없어서 required 삭제.
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 55,
        ),
        child: Text(
          text,
          style: TextStyle(
            //const Padding이면 변수로 넘어오는
            fontSize: 20, //text와 textColor가 접근을 할 수 없으니
            color: textColor, //const를 풀어서 padding에 접근할 수 있도록 함.
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
