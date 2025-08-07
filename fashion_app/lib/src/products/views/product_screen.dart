import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart' show placeholder, errorWidget;
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:fashion_app/src/products/widgets/color_selection.dart';
import 'package:fashion_app/src/products/widgets/expandable_product.dart';
import 'package:fashion_app/src/products/widgets/product_sizes_widget.dart';
import 'package:fashion_app/src/products/widgets/similar_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    print(context.read<ProductNotifier>().product!.title);
    return Consumer<ProductNotifier>(
        builder: (context, productNotifier, child) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 320.h,
              collapsedHeight: 65.h,
              floating: true,
              pinned: true,
              leading: const AppBackButton(),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: MColors.kSecondaryLight,
                      radius: 10,
                      child: Icon(
                        AntDesign.heart,
                        color: MColors.kRed,
                        size: 18,
                      ),
                    ),
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: SizedBox(
                  height: 320.h,
                  child: ImageSlideshow(
                    indicatorColor: MColors.kPrimary,
                    onPageChanged: (value) {
                      print(value);
                    },
                    autoPlayInterval: 7000,
                    isLoop: productNotifier.product!.imageUrls.length > 1,
                    children: List.generate(
                        productNotifier.product!.imageUrls.length, (index) {
                      // print(images[index]);
                      return CachedNetworkImage(
                        placeholder: placeholder,
                        imageUrl: productNotifier.product!.imageUrls[index],
                        errorWidget: errorWidget,
                        fit: BoxFit.cover,
                        height: 415.h,
                      );
                    }),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                        text:
                            productNotifier.product!.clothesType.toUpperCase(),
                        style: appStyle(13, MColors.kDark, FontWeight.w600)),
                    Row(
                      children: [
                        const Icon(
                          AntDesign.star,
                          color: MColors.kGold,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ReusableText(
                            text: productNotifier.product!.ratings
                                .toStringAsFixed(1),
                            style: appStyle(
                              13,
                              MColors.kGray,
                              FontWeight.w600,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ReusableText(
                  text: productNotifier.product!.title,
                  style: appStyle(16, MColors.kDark, FontWeight.w600),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: ExpandableText(
                  text: productNotifier.product!.description,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 8.w),
                child: const Divider(
                  // color: MColors.kGray,
                  thickness: 0.5,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                // height: 10.h,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: 'Select Sizes',
                    style: appStyle(
                      16,
                      MColors.kDark,
                      FontWeight.w600,
                    )),
              ),
            ),

            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ProductSizesWidget(),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 10.h,
            //   ),
            // ),

            SliverToBoxAdapter(
              child: Padding(
                // height: 10.h,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: 'Select Color',
                    style: appStyle(
                      16,
                      MColors.kDark,
                      FontWeight.w600,
                    )),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ColorSelectionWidget(),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                // height: 10.h,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                    text: 'Similar Products',
                    style: appStyle(
                      16,
                      MColors.kDark,
                      FontWeight.w600,
                    )),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),

            const SliverToBoxAdapter(
              child: SimilarProduct(),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
          ],
        ),
      );
    });
  }
}
