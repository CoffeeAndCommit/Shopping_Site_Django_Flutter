import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: MColors.kWhite,
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Image.asset(
                My.ASSETS_IMAGES_GETSTARTED_PNG,
                 width: 1.sw,
                height: 0.5.sh,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(

                AppText.kWelcomeHeader,
                textAlign: TextAlign.center,
                style: appStyle(
                  24,
                  MColors.kPrimary,
                  FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: ScreenUtil().screenWidth - 100,
                child: Text(
                  AppText.kWelcomeMessage,
                  style: appStyle(
                    11,
                    MColors.kGray,
                    FontWeight.normal,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
