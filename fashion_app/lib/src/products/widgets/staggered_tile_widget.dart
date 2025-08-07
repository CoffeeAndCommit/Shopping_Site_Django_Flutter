import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:fashion_app/src/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StaggeredTileWidget extends StatelessWidget {
  // const StaggeredTileWidget({super.key});
  const StaggeredTileWidget(
      {super.key, required this.i, required this.product, required this.onTap});

  final int i;
  final Products product;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    String? accesstoken = Storage().getString('accesstoken');

    return GestureDetector(
      onTap: () {
        // context.push('/product/${product.id}');
        context.read<ProductNotifier>().setproduct(product);
        context.push('/product/${product.id}');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: MColors.kOffWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: i % 2 == 0 ? 163.h : 180.h,
                color: MColors.kPrimary,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.imageUrls[0],
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        right: 10.h,
                        top: 10.h,
                        child: GestureDetector(
                          onTap: onTap,
                          child: const CircleAvatar(
                            backgroundColor: MColors.kSecondaryLight,
                            radius: 10,
                            child: Icon(
                              AntDesign.heart,
                              color: MColors.kRed,
                              size: 18,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.h,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(13, MColors.kDark, FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    ReusableText(
                      text: product.ratings.toStringAsFixed(1),
                      style: appStyle(
                        13,
                        MColors.kGray,
                        FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ReusableText(
                  text: '\$${product.price.toString()}',
                  style: appStyle(17, MColors.kDark, FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
