import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';
import 'package:test_project/components/my_orderlist_form.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주문내역', style: pretendardSemiBold(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 45.12,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.black),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '상호명, 메뉴 이름 검색',
                        style: pretendardRegular(context).copyWith(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.shadow,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.tune, color: Colors.black),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  OrderListForm(
                    date: '7.16 (화)',
                    status: '픽업완료',
                    statusColor: const Color(0xFF71727A),
                    title: '양덕동마카롱',
                    description: '카라멜 마카롱',
                    image: 'assets/images/ranking_2.png',
                  ),
                  const SizedBox(height: 25),
                  OrderListForm(
                    date: '7.4 (목)',
                    status: '주문취소',
                    statusColor: const Color(0xFFFF0000),
                    title: '비건베이커리',
                    description: '앙버터 베이글, 카야버터 베이글',
                    image: 'assets/images/ranking_2.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
