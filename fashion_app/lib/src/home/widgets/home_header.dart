import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/utils/kstrings.dart' show AppText;
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
            text: AppText.kCategories,
            style: appStyle(13, MColors.kDark, FontWeight.w600)),
        GestureDetector(
          onTap: () {
            context.push('/categories');
          },
          child: ReusableText(
              text: AppText.kViewAll,
              style: appStyle(13, MColors.kGray, FontWeight.normal)),
        )
      ],
    );
  }
}
