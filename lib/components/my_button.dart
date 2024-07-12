import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';

class Button extends StatelessWidget { //
  const Button( //파라미터
          {Key? key,
        required this.function,
        required this.title,
        this.condition = "not null",
        required this.color})
      : super(key: key);

  final String title;
  final Function function;
  final String condition;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: condition.contains("not null")
          ? () {
        function();
      }
          : null,
      child: Container(
        width: MediaQuery.of(context).size.width, //MediaQuery 를 통해서 버튼 넓이 설정해놓음.
        decoration: BoxDecoration(
            color: condition.contains("not null") ? color : Colors.grey,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: pretendardSemiBold(context) // Text Regular로 설정. 설정 관련은 font.dart
          ),
        ),
      ),
    );
  }
}