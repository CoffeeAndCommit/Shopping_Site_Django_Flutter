import 'package:fashion_app/common/utils/enums.dart';
import 'package:fashion_app/src/home/controller/home_tab_notifier.dart';
import 'package:fashion_app/src/home/widgets/categories_list.dart';
import 'package:fashion_app/src/home/widgets/home_header.dart';
import 'package:fashion_app/src/home/widgets/home_slider.dart';
import 'package:fashion_app/src/home/widgets/home_tabs.dart';
import 'package:fashion_app/src/products/widgets/explore_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: homeTabs.length, vsync: this);
    tabController.addListener(_handleSelection);

    super.initState();
  }

  void _handleSelection() {
    final controller = Provider.of<HomeTabNotifier>(context, listen: false);

    if (tabController.indexIsChanging) {
      setState(() {
        _currentTabIndex = tabController.index;
      });
      controller.setIndex(homeTabs[_currentTabIndex]);
    }
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.removeListener(_handleSelection);
    tabController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(110), child: CustomAppBar()),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          SizedBox(
            height: 20.h,
          ),
          const HomeSlider(),
          SizedBox(
            height: 15.h,
          ),
          const HomeHeader(),
          SizedBox(
            height: 15.h,
          ),
          const HomeCategoriesList(),
          SizedBox(
            height: 15.h,
          ),
          HomeTabs(tabController: tabController),
          SizedBox(
            height: 15.h,
          ),
          const ExploreProducts(),

           SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}

List<String> homeTabs = [
  'All',
  'Popular',
  'Unisexes',
  'Mens',
  'Womens',
  'Kids',
];
