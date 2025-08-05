import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

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
              My.ASSETS_IMAGES_EXPERIENCE_PNG,
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
              AppText.kOnboardHome,
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

// import 'package:fashion_app/common/utils/colors.dart';
// import 'package:fashion_app/common/utils/kstrings.dart';
// import 'package:fashion_app/common/widgets/app_style.dart';
// import 'package:fashion_app/const/resource.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class OnboardingScreenOne extends StatefulWidget {
//   const OnboardingScreenOne({super.key});

//   @override
//   State<OnboardingScreenOne> createState() => _OnboardingScreenOneState();
// }

// class _OnboardingScreenOneState extends State<OnboardingScreenOne> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: ScreenUtil().screenWidth,
//       height: ScreenUtil().screenHeight,
//       child: Stack(
//         children: [
//           Image.asset(
//             My.ASSETS_IMAGES_EXPERIENCE_PNG,
//             fit: BoxFit.cover,
//           ),
//           Positioned(
//               bottom: 200,
//               left: 30,
//               right: 30,
//               child: Text(
//                 AppText.kOnboardHome,
//                 textAlign: TextAlign.center,
//                 style: appStyle(
//                   11,
//                   MColors.kGray,
//                   FontWeight.normal,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
