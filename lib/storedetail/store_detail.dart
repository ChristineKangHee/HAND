import 'package:flutter/material.dart';
// import 'package:test_project/components/my_tap_bar.dart';
import 'package:test_project/theme/font.dart';
import 'package:test_project/components/my_navigationbar.dart';
import '../components/my_divider.dart';

class StoreDetailPage extends StatefulWidget {
  final String name;

  const StoreDetailPage({Key? key, required this.name}) : super(key: key);

  @override
  State<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildHeader(context)
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );


    // Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         _buildHeader(context),
    //         _buildStoreDetails(context),
    //       ],
    //     ),
    //   ),
    //   bottomNavigationBar: const CustomNavigationBar(),
    // );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1634560604992-7784a29bc419?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined, color: Theme.of(context).colorScheme.surface),
                  onPressed: () => Navigator.pop(context),
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_border, color: Theme.of(context).colorScheme.surface),
                    SizedBox(width: 10),
                    Icon(Icons.shopping_cart_outlined, color: Theme.of(context).colorScheme.surface),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 170),
        ],
      ),
    );
  }

  Widget _buildStoreDetails(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '포항시 북구 양덕동',
                  style: pretendardMedium(context).copyWith(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '양덕동 마카롱',
                  style: pretendardSemiBold(context).copyWith(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star_rounded, color: Colors.yellow[700], size: 16),
                    SizedBox(width: 5),
                    Text(
                      '5.0',
                      style: pretendardSemiBold(context).copyWith(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '/ 116개의 리뷰',
                      style: pretendardMedium(context).copyWith(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SmallDivider(),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, color: Theme.of(context).colorScheme.secondary),
                    SizedBox(width: 6),
                    Text(
                      '영업중',
                      style: pretendardMedium(context).copyWith(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      '오늘 09:30 ~ 20:00',
                      style: pretendardMedium(context).copyWith(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionItem(context, '전화', Icon(Icons.call_outlined, color: Theme.of(context).colorScheme.shadow)),
                    const SizedBox(width: 10),
                    _buildActionItem(context, '공유', Icon(Icons.ios_share_rounded, color: Theme.of(context).colorScheme.shadow)),
                    const SizedBox(width: 10),
                    _buildActionItem(context, '알림', Icon(Icons.notifications_outlined, color: Theme.of(context).colorScheme.shadow)),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          BigDivider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTapBar(tablController: _tabController),
                SizedBox(height: 10),
                // TabBarView(
                //   controller: _tabController,
                //   children: [
                //     // Replace with your content for each tab
                //     Center(child: Text('Tab 1 Content')),
                //     Center(child: Text('Tab 2 Content')),
                //     Center(child: Text('Tab 3 Content')),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, String text, Widget icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              child: icon,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: pretendardMedium(context).copyWith(
                fontSize: 14,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTapBar extends StatelessWidget{
  final TabController tablController;
  const MyTapBar({
    super.key,
    required this.tablController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tablController,
        tabs: [
          Tab(text: '메뉴',),
          Tab(text: '정보',),
          Tab(text: '리뷰',),
        ],
      ),
    );
  }

}