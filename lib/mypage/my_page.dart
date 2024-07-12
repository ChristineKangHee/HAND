import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지', style: pretendardRegular(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("MyPage", style: pretendardRegular(context),)
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}