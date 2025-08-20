import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:fashion_app/src/categories/controller/category_notifier.dart';
import 'package:fashion_app/src/categories/hook/fetch_product_bycategory.dart';
import 'package:fashion_app/src/products/widgets/staggered_tile_widget.dart';
import 'package:fashion_app/src/wishlist/controllers/wishlist_notifiers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductsByCategory extends HookWidget {
  const ProductsByCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    final reults = fetchProductsByCategories(
      context.read<CategoryNotifier>().id,
    );

    final products = reults.products;
    final isLoading = reults.isLoading;
    final error = reults.error;

    if (isLoading) {
      return const Scaffold(
        body: ListShimmer(),
      );
    }
    return products.isEmpty
        ? EmptyWidget()
        : Padding(
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
                               context
                                .read<WishlistNotifiers>()
                                .addRemoveWishlist(product.id, () {});
                          }
                        },
                      ));
                })),
          );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
          My.ASSETS_IMAGES_EMPTY_PNG,
          height: ScreenUtil().screenHeight * .3,
        ),
      );
  }
}
