import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';
import 'package:test_project/theme/theme.dart';

import '../components/my_divider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final widthRatio = screenWidth / 360;
    final heightRatio = screenHeight / 780;

    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지', style: pretendardSemiBold(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.95,
              padding: EdgeInsets.symmetric(horizontal: 15 * widthRatio, vertical: 13 * heightRatio),
              decoration: ShapeDecoration(
                color: const Color(0xFFF8F9FE), //more light
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: const Icon(Icons.person),
                      ), // 프로필 사진
                      SizedBox(width: 12 * widthRatio),
                      Container(
                        width: screenWidth * 0.75,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '제로',
                                      style: pretendardSemiBold(context).copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 20 * widthRatio),
                                    Icon(Icons.create, color: Theme.of(context).colorScheme.primary),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 3 * heightRatio),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '내 포인트',
                                  style: pretendardRegular(context).copyWith(
                                    fontSize: 14,
                                    color: Theme.of(context).colorScheme.shadow,
                                  ),
                                ),
                                SizedBox(width: 11 * widthRatio),
                                Text(
                                  '1,320 p',
                                  style: pretendardSemiBold(context).copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20 * heightRatio),
            Container(
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SmallDivider(),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            '정보',
                            style: pretendardSemiBold(context).copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: screenWidth > 600 ? 16 : 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: screenWidth > 600 ? 300 : screenWidth * 0.5,
                                child: Text(
                                  '계정 및 정보 관리',
                                  style: pretendardSemiBold(context),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right, color: Colors.black),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: screenWidth > 600 ? 120 : screenWidth * 0.2,
                                child: Text(
                                  '내 포인트',
                                  style: pretendardSemiBold(context),
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_right, color: Colors.black),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            '문의 및 알림',
                            style: pretendardSemiBold(context).copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: screenWidth > 600 ? 16 : 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 19),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth > 600 ? 120 : screenWidth * 0.2,
                                child: Text(
                                  '공지사항',
                                  style: pretendardSemiBold(context),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right, color: Colors.black),
                            ],
                          ),
                        ),
                        const SizedBox(height: 19),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth > 600 ? 300 : screenWidth * 0.5,
                                child: Text(
                                  '자주 묻는 질문 (FAQ)',
                                  style: pretendardSemiBold(context),
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_right, color: Colors.black),
                            ],
                          ),
                        ),
                        const SizedBox(height: 19),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth > 600 ? 300 : screenWidth * 0.5,
                                child: Text(
                                  '약관 및 정책',
                                  style: pretendardSemiBold(context),
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_right, color: Colors.black),
                            ],
                          ),
                        ),
                        const SizedBox(height: 19),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenWidth > 600 ? 300 : screenWidth * 0.5,
                                child: Text(
                                  '버전 정보 1.0',
                                  style: pretendardSemiBold(context),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right, color: Colors.black),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const SmallDivider(),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '로그아웃',
                          style: pretendardSemiBold(context),
                        ),
                        Icon(Icons.keyboard_arrow_right, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
