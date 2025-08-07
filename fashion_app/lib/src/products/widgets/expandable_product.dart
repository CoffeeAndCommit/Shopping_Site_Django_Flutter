import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpandableText extends StatelessWidget {
  const ExpandableText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: TextAlign.justify,
            maxLines:
                !context.watch<ProductNotifier>().description ? 1 : 10,
                style: appStyle(14, MColors.kGray, FontWeight.w400),
                overflow: TextOverflow.ellipsis,
          ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context.read<ProductNotifier>().setdescription();
                },
      
                child: Text(!context.watch<ProductNotifier>().description
                    ? 'Read more'
                    : 'Read less',
                    style: appStyle(11, MColors.kPrimaryLight, FontWeight.normal,)),
              )
            ],
          )
        ],
      ),
    );
  }
}
