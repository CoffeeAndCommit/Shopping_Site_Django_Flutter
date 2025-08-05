


import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreentwo extends StatelessWidget {
  const OnboardingScreentwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw, // screen width
      height: 1.sh, // screen height
      child: Stack(
        children: [
          // Background image fills screen
          Positioned.fill(
            child: Image.asset(
              My.ASSETS_IMAGES_WISHLIST_PNG,
              width: 1.sw,
              height: 1.sh,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),

          // Responsive text position
          Positioned(
            bottom: 50, // scales based on screen height
            left: 30.w, // scales based on screen width
            right: 30.w,
            child: Text(
              AppText.kOnboardWishListMessage,
              textAlign: TextAlign.center,
              style: appStyle(
                11, // responsive font size
                MColors.kGray,
                FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  
  }
}