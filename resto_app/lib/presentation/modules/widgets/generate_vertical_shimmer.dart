import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class GenerateVerticalShimmer extends StatelessWidget {
  const GenerateVerticalShimmer({this.physics});
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: 7,
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      physics: physics ?? ClampingScrollPhysics(),
      itemBuilder: (_, __) => Container(
        height: context.height * 0.12,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: context.theme.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade800,
              highlightColor: Colors.grey.shade700,
              direction: ShimmerDirection.rtl,
              child: Container(
                width: context.width * 0.24,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.mediaQuery.padding.left + 8.0,
                right: context.mediaQuery.padding.right + 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade800,
                    highlightColor: Colors.grey.shade700,
                    direction: ShimmerDirection.rtl,
                    child: Container(
                      color: Colors.grey.shade800,
                      width: context.width * 0.3,
                      height: context.height * 0.015,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade800,
                    highlightColor: Colors.grey.shade700,
                    direction: ShimmerDirection.rtl,
                    child: Container(
                      color: Colors.grey.shade800,
                      width: context.width * 0.2,
                      height: context.height * 0.015,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade800,
                    highlightColor: Colors.grey.shade700,
                    direction: ShimmerDirection.rtl,
                    child: Container(
                      color: Colors.grey.shade800,
                      width: context.width * 0.1,
                      height: context.height * 0.015,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
