import 'package:flutter/material.dart';
import 'package:test_project/components/my_navigationbar.dart';
import '../components/my_divider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/font.dart';

class StoreDetailPage extends StatefulWidget {
  final String name;

  const StoreDetailPage({Key? key, required this.name}) : super(key: key);

  @override
  State<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 150 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 150 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "https://images.unsplash.com/photo-1634560604992-7784a29bc419?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  fit: BoxFit.cover,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_outlined,
                    color: _isScrolled
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.surface),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.favorite_border,
                      color: _isScrolled
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.surface),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined,
                      color: _isScrolled
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.surface),
                  onPressed: () {},
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _buildStoreDetails(context),
                MyTapBar(tablController: _tabController),
                SizedBox(height: 10),
                Container(
                  height: 800,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Center(child: Text('Tab 1 Content')),
                      Center(child: Text('Tab 2 Content')),
                      Center(child: Text('Tab 3 Content')),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }

  Widget _buildStoreDetails(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
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
                    color: _isScrolled
                        ? Theme.of(context).colorScheme.surface
                        : Theme.of(context).colorScheme.onSurface,
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
                        color: _isScrolled
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context).colorScheme.onSurface,
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
                    Icon(Icons.access_time_rounded,
                        color: Theme.of(context).colorScheme.secondary),
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
                    _buildActionItem(context, '전화',
                        Icon(Icons.call_outlined,
                            color: Theme.of(context).colorScheme.shadow)),
                    const SizedBox(width: 10),
                    _buildActionItem(context, '공유',
                        Icon(Icons.ios_share_rounded,
                            color: Theme.of(context).colorScheme.shadow)),
                    const SizedBox(width: 10),
                    _buildActionItem(context, '알림',
                        Icon(Icons.notifications_outlined,
                            color: Theme.of(context).colorScheme.shadow)),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          BigDivider(),
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
              style: TextStyle(
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

class MyTapBar extends StatelessWidget {
  final TabController tablController;

  const MyTapBar({
    Key? key,
    required this.tablController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tablController,
        tabs: [
          Tab(text: '메뉴'),
          Tab(text: '정보'),
          Tab(text: '리뷰'),
        ],
      ),
    );
  }
}