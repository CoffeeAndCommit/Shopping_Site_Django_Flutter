import 'dart:developer';

import 'package:fashion_app/src/onboarding/controller/onboarding_notifier.dart';
import 'package:fashion_app/src/onboarding/widgets/onboarding_page_one.dart';
import 'package:fashion_app/src/onboarding/widgets/onboarding_page_two.dart';
import 'package:fashion_app/src/onboarding/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
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
            controller: PageController(),
            onPageChanged: (value) {
              provider.selectedPage = value;
            },
            children: const [
              OnboardingScreenOne(),
              OnboardingScreentwo(),
              WelcomeScreen()
            ],
          ),
        ],
      ),
    );
  }
}
