import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar({super.key, required this.price, this.onPress});

  final String price;

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      color: Colors.white.withOpacity(.6),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.w, 12.h, 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60.h,
              width: 120.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: 'Total Price',
                      style: appStyle(
                        14,
                        MColors.kGray,
                        FontWeight.normal,
                      )),
                  ReusableText(
                      text: '\$$price',
                      style: appStyle(
                        14,
                        MColors.kDark,
                        FontWeight.w600,
                      ))
                ],
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MColors.kPrimary),
                ),
                onPressed: onPress,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesome.shopping_bag,
                      size: 16,
                      color: MColors.kWhite,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    ReusableText(
                      text: 'Checkout',
                      style: appStyle(
                        14,
                        MColors.kWhite,
                        FontWeight.bold,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
