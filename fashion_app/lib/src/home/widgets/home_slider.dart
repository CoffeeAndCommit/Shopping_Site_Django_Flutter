import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: mRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: ImageSlideshow(
              indicatorColor: MColors.kPrimary,
              onPageChanged: (value) {
          
              },
              autoPlayInterval: 3000,
              isLoop: true,
              children: List.generate(images.length, (index) {
                 
                return CachedNetworkImage(
                  placeholder: placeholder,
                  imageUrl: images[index],
                  errorWidget: errorWidget,
                  fit: BoxFit.cover,
                );
              }),
            ),
          ),
          Positioned(
              child: SizedBox(
            height: ScreenUtil().screenHeight * 0.16,
            width: ScreenUtil().screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: AppText.kCollection,
                    style: appStyle(
                      20,
                      MColors.kDark,
                      FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Discount 50% off on all items',
                    style: appStyle(14, MColors.kDark.withOpacity(0.6), FontWeight.normal),
                  ),
                   SizedBox(
                    height: 10.h,
                  ),

                  CustomButton(
                    text: 'Shop Now',
                    onTap: () {},
                    btnHieght: 35.h,
                    radius: 16,
                    btnWidth: 150.w
                  )
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}

List<String> images = [
  'https://t3.ftcdn.net/jpg/06/36/44/26/240_F_636442646_II8z4yhYbPoea8P6HoimUblo6ZQXzUXY.jpg',
  'https://t3.ftcdn.net/jpg/03/20/68/66/240_F_320686681_Ur6vdYQgDC9WiijiVfxlRyQffxOgfeFz.jpg',
  'https://t4.ftcdn.net/jpg/03/67/56/73/240_F_367567354_JnT96QOWu8rugfLdYaESxWkqaIOUja8t.jpg',
  'https://t4.ftcdn.net/jpg/03/70/21/63/240_F_370216304_wciGBVZ0zDxrT2UhbKeXAFxkVmjEv28i.jpg',
];
