import 'package:fashion_app/src/home/widgets/categories_list.dart';
import 'package:fashion_app/src/home/widgets/home_header.dart';
import 'package:fashion_app/src/home/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        ],
      ),
    );
  }
}
