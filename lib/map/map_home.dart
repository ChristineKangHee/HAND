import 'package:flutter/material.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';

class MapHomePage extends StatelessWidget {
  const MapHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('맵', style: pretendardRegular(context)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("맵", style: pretendardRegular(context),)
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}