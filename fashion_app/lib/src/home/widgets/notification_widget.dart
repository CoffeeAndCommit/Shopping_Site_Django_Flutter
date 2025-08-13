import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Storage().getString('accesstoken') == null) {

          loginBottomSheet(context);
        } else {
          context.push('/notifications');
        }

        
      },
      child: Padding(
        padding: const EdgeInsetsGeometry.only(right: 12),
        child: CircleAvatar(
          backgroundColor: MColors.kGrayLight.withOpacity(0.3),
          child: const Badge(
            label: Text('1'),
            child: Icon(
              Icons.notifications,
              color: MColors.kPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
