import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/home/controller/home_tab_notifier.dart';
import 'package:fashion_app/src/products/hooks/fetch_products.dart';
import 'package:fashion_app/src/products/widgets/staggered_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ExploreProducts extends HookWidget {
  const ExploreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    final results = fetchProducts(context.watch<HomeTabNotifier>().queryType);
    final product = results.products;
    final isLoading = results.isLoading;
    final error = results.error;

    if (isLoading) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          child: const ListShimmer(),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: List.generate(products.length, (i) {
            final double mainAxisCellCount = i.isEven ? 2.17 : 2.4;
            final product = products[i];
            return StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: mainAxisCellCount,
                child: StaggeredTileWidget(
                  product: product,
                  i: i,
                  onTap: () {
                    if (accessToken == null) {
                      loginBottomSheet(context);
                    } else {
                      //  Handle wishlist functionality
                    }
                  },
                ));
          })),
    );
  }
}
