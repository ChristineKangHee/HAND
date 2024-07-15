import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';

/*
    사용 방법

    // 혹시 폰트나, 색상 변경 필요하면 박민준 문의 바람

    1. 앱 기본 사용 버튼 (앱 Primary 컬러)
    Container(
      width: MediaQuery.of(context).size.width,
      child: Button(
        function: () {
          print("Button pressed");
          //function 은 상황에 맞게 재 정의 할 것.
        },
        title: 'Custom Button',
        // 버튼 안에 들어갈 텍스트.
      ),
    ),

    2. Natural Color 버튼
    Container(
      width: MediaQuery.of(context).size.width,
      child: ButtonNatural(
        function: () {
          print("Button pressed");
          //function 은 상황에 맞게 재 정의 할 것.
        },
        title: 'Custom Button',
        // 버튼 안에 들어갈 텍스트.
      ),
    ),

 */

class Button extends StatelessWidget { //
  const Button( //파라미터
          {Key? key,
        required this.function,
        required this.title,
        this.condition = "not null",
        })
      : super(key: key);

  final String title;
  final Function function;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: condition.contains("not null")
          ? () {
        function();
      }
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width, //MediaQuery 를 통해서 버튼 넓이 설정해놓음.
          decoration: BoxDecoration(
              color: condition.contains("not null") ? Theme.of(context).colorScheme.primary : Colors.grey,
              borderRadius: BorderRadius.circular(12)), // Button Edge 둥글게
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: pretendardSemiBold(context) // Text Regular로 설정. 설정 관련은 font.dart
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonNatural extends StatelessWidget { //
  const ButtonNatural( //파라미터
          {Key? key,
        required this.function,
        required this.title,
        this.condition = "not null",
      })
      : super(key: key);

  final String title;
  final Function function;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: condition.contains("not null")
          ? () {
        function();
      }
          : null,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width, //MediaQuery 를 통해서 버튼 넓이 설정해놓음.
          decoration: BoxDecoration(
              color: condition.contains("not null") ? Theme.of(context).colorScheme.outline : Colors.grey,
              borderRadius: BorderRadius.circular(12)), // Button Edge 둥글게
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Text(
                title,
                textAlign: TextAlign.center,
                style: pretendardSemiBold(context) // Text Regular로 설정. 설정 관련은 font.dart
            ),
          ),
        ),
      ),
    );
  }
}