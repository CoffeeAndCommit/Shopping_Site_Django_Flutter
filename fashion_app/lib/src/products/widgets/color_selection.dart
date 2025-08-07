import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/products/controllers/colors_sizes_controller.dart';
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ColorSelectionWidget extends StatelessWidget {
  const ColorSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ColorsSizesController>(
        builder: (context, colorsSizesController, child) {
        
      return 
         SizedBox(
          width: MediaQuery.of(context).size.width,
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  context.read<ProductNotifier>().product!.colors.length, (index) {
                String s = context.read<ProductNotifier>().product!.colors[index];
                return GestureDetector(
                  onTap: () {
                    //  colorsSizesController.setSizes(context.read<ColorsSizesController>().sizes[index]);
                   
                    context.read<ColorsSizesController>().setColor(s);
                  },
                  child: Container(
                  padding: EdgeInsets.only(right: 20.w, left: 20.w, ),
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    // color: s == colorsSizesController.color ? MColors.kPrimary : MColors.kGrayLight,
                    color: s == colorsSizesController.color ? MColors.kPrimary : MColors.kGrayLight,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ReusableText(text: s, style: appStyle(16, MColors.kWhite, FontWeight.normal)),
                  ),
                );
              })
                 ),
         );
    });
  }
  
}