import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/tab_widget.dart';
import 'package:fashion_app/src/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key, required TabController tabController})
      : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 22,
        child: TabBar(
          indicator: BoxDecoration(
            color: MColors.kPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          labelPadding: EdgeInsets.zero,
          labelColor: Colors.white,
          dividerColor: Colors.transparent,
          controller: _tabController,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelStyle: appStyle(11, MColors.kGray, FontWeight.w600),
          unselectedLabelStyle: appStyle(11, MColors.kGray, FontWeight.normal),
          tabs: List.generate(
              homeTabs.length,
              (i) => Tab(
                    child: TabWidget(
                      text: homeTabs[i],
                    ),
                  )),
        ));
  }
}
