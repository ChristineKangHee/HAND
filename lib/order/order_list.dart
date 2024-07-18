import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문내역', style: pretendardRegular(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("주문내역", style: pretendardRegular(context),)
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}