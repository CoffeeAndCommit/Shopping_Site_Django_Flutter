import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/help_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/auth/views/login_screen.dart';
import 'package:fashion_app/src/profile/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
// import 'package:octicons/octicons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    if (accessToken == null) {
      return const LoginPage();
    }
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            const CircleAvatar(
              radius: 35,
              backgroundColor: MColors.kOffWhite,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            SizedBox(
              height: 15.h,
            ),
            ReusableText(
                text: 'medha@gmail.com',
                style: appStyle(
                  11,
                  MColors.kGray,
                  FontWeight.normal,
                )),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ReusableText(
                text: 'medhavi ',
                style: appStyle(
                  14,
                  MColors.kDark,
                  FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          color: MColors.kOffWhite,
          child: Column(
            children: [
              ProfileTileWidget(
                leading: Octicons.checklist,
                title: 'My Orders',
                onTap: () {
                  context.push('/orders');
                },
              ),
              ProfileTileWidget(
                leading: MaterialIcons.location_city,
                title: 'Shipping Address',
                onTap: () {
                  context.push('/address');
                },
              ),
              ProfileTileWidget(
                leading: MaterialIcons.policy,
                title: 'Privacy Policy',
                onTap: () {
                  context.push('/policy');
                },
              ),
              ProfileTileWidget(
                leading: AntDesign.customerservice,
                title: 'Help Center',
                onTap: () => showHelpCenterBottomSheet(context),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: CustomButton(
                  text: "Logout",
                  btnColor: MColors.kRed,
                  btnWidth: ScreenUtil().screenWidth - 40,
                  onTap: () {
                    print('logout');
                    Storage().removeKey('accessToken');
                    context.go('/home');
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
