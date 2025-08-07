import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileTileWidget extends StatelessWidget {
  ProfileTileWidget({super.key, required this.title, required this.leading, this.onTap});

  final String title;
  final IconData leading;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      visualDensity: VisualDensity.compact,
      leading: Icon(
        leading,
        size: 24,
        color: MColors.kGray,
      ),
      title: Text(
        title,
        style: appStyle(
          13,
          MColors.kDark,
          FontWeight.normal,
        ),
      ),
      trailing: const Icon(
        AntDesign.right,
        size: 16,
        color: MColors.kDark,
      ),
    );
  }
}
