import 'dart:developer';

import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/src/onboarding/controller/onboarding_notifier.dart';
import 'package:fashion_app/src/onboarding/widgets/onboarding_page_one.dart';
import 'package:fashion_app/src/onboarding/widgets/onboarding_page_two.dart';
import 'package:fashion_app/src/onboarding/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pagecontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagecontroller = PageController(
      initialPage: context.read<OnboardingNotifier>().selectedPage,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pagecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingNotifier>(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pagecontroller,
            onPageChanged: (value) {
              provider.selectedPage = value;
            },
            children: const [
              OnboardingScreenOne(),
              OnboardingScreentwo(),
              WelcomeScreen()
            ],
          ),
          context.watch<OnboardingNotifier>().selectedPage == 2
              ? const SizedBox.shrink()
              : Positioned(
                  bottom: 10.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    width: ScreenUtil().screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        context.watch<OnboardingNotifier>().selectedPage == 0
                            ? const SizedBox.shrink()
                            : GestureDetector(
                                onTap: () {
                                  _pagecontroller.animateToPage(
                                      context
                                              .read<OnboardingNotifier>()
                                              .selectedPage -
                                          1,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                child: const Icon(
                                  AntDesign.leftcircleo,
                                  color: MColors.kPrimary,
                                  size: 30,
                                ),
                              ),
                        SizedBox(
                          width: ScreenUtil().screenWidth * 0.6,
                          height: 50.h,
                          child: PageViewDotIndicator(
                            currentItem: context
                                .watch<OnboardingNotifier>()
                                .selectedPage,
                            count: 3,
                            unselectedColor: Colors.black26,
                            selectedColor: MColors.kPrimary,
                            duration: const Duration(milliseconds: 200),
                            onItemClicked: (index) {
                              _pagecontroller.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          child: const Icon(
                            AntDesign.rightcircleo,
                            color: MColors.kPrimary,
                            size: 30,
                          ),
                          onTap: () {
                            _pagecontroller.animateToPage(
                                context
                                        .read<OnboardingNotifier>()
                                        .selectedPage +
                                    1,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          },
                        )
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
