import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigator();
  }

  _navigator() async {
    await Future.delayed(const Duration(seconds: 5), () {
      if (Storage().getBool('firstOpen') == null) {
        // go to onboarding page
        GoRouter.of(context).go('/onboarding');
        // Storage().setBool('firstOpen', true);
      } else {
        //  go to home page
        GoRouter.of(context).go('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: MColors.kDark,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(My.ASSETS_IMAGES_SPLASHSCREEN_PNG),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
