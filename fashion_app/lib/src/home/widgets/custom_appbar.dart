import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/home/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: 'Location',
            style: appStyle(
              12,
              MColors.kGray,
              FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Icon(
                Ionicons.location,
                size: 16,
                color: MColors.kPrimary,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: SizedBox(
                  width: ScreenUtil().screenWidth * 0.7,
                  child: Text(
                    'Please select a loaction',
                    maxLines: 1,
                    style: appStyle(
                      14,
                      MColors.kPrimary,
                      FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      actions: const [
        // Padding(
        //   padding: EdgeInsets.all(4.0),
        //   child: Icon(
        //     Icons.search,
        //     color: Colors.black,
        //   ),
        // ),

        Padding(
          padding: EdgeInsets.all(8.0),
          child: NotificationWidget(),
        ),
      ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: GestureDetector(
            onTap: () {
              context.push('/search');
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 40.h,
                        width: ScreenUtil().screenWidth - 80,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.5, color: MColors.kGray),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Ionicons.search_outline,
                                size: 20,
                                color: MColors.kPrimaryLight,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              ReusableText(
                                  text: "Search",
                                  style: appStyle(
                                    14,
                                    MColors.kGray,
                                    FontWeight.w400,
                                  ))
                            ],
                          ),
                        )),
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: MColors.kPrimary,
                          borderRadius: BorderRadius.circular(9.0)),
                      child: const Icon(
                        FontAwesome.sliders,
                        size: 20,
                        color: MColors.kWhite,
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
