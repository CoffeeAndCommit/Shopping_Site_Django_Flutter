import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/common/widgets/shimmers/categories_shimmer.dart';
import 'package:fashion_app/src/categories/controller/category_notifier.dart';
import 'package:fashion_app/src/categories/hook/fetch_home_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeCategoriesList extends HookWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final results = fetchHomeCategories();
    final categories = results.categories;

    final isLoading = results.isLoading;

    final error = results.error;

    if (isLoading) {
      return const CatergoriesShimmer();
    }

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
                        // child: SvgPicture.network(category.imageUrl),
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
