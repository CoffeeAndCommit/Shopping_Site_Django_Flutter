import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/src/products/controllers/colors_sizes_controller.dart';
import 'package:fashion_app/src/products/controllers/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductSizesWidget extends StatelessWidget {
  const ProductSizesWidget({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Consumer<ColorsSizesController>(
        builder: (context, colorsSizesController, child) {
            print('select sizes2');
      return 
         SizedBox(
          width: MediaQuery.of(context).size.width,
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  context.read<ProductNotifier>().product!.sizes.length, (index) {
                String s = context.read<ProductNotifier>().product!.sizes[index];
                return GestureDetector(
                  onTap: () {
                    //  colorsSizesController.setSizes(context.read<ColorsSizesController>().sizes[index]);
                   
                    context.read<ColorsSizesController>().setSizes(s);
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      color: colorsSizesController.sizes == s
                          ? MColors.kPrimary
                          : MColors.kGrayLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(s,
                          style: appStyle(
                            20,
                            MColors.kWhite,
                            FontWeight.bold,
                          )),
                    ),
                  ),
                );
              })
                 ),
         );
    });
  }
}
