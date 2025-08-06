import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/categories/controller/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 3.w),
      child: SizedBox(
        height: 80.h,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(categories.length, (i) {
              final category = categories[i];
              return GestureDetector(
                onTap: () {
                  context.read<CategoryNotifier>().setCategory(
                        category.title,
                        category.id,
                      );
                  context.push('/category');
                },
                child: SizedBox(
                    child: Column(
                  children: [
                   CircleAvatar(
                      backgroundColor: MColors.kSecondaryLight,
                      radius: 18,
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(8.h),
                        child: SvgPicture.network(category.imageUrl),
                      ),
                    ),
                    ReusableText(
                      text: category.title,
                      style: appStyle(12, MColors.kPrimary, FontWeight.w400),
                    )
                  ],
                )),
              );
            })),
      ),
    );
  }
}
