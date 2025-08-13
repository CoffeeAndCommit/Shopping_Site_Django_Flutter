// import 'package:fashion/common/widgets/shimmers/shimmer_widget.dart';
import 'package:fashion_app/common/widgets/shimmers/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatergoriesShimmer extends StatelessWidget {
  const CatergoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 10),
      height: 75.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ShimmerWidget(
                        shimmerWidth: 30.w,
                        shimmerHieght: 30.h,
                        shimmerRadius: 12, 
                        ),
                        SizedBox(width: 20.w,)
                  ],
                ),
              ],
            );
          }),
    );
  }
}
