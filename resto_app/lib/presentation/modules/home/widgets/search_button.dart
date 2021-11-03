import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.grey.shade300,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: context.height * 0.07,
          width: context.width,
          decoration: BoxDecoration(
            // color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.only(
            left: context.mediaQuery.padding.left + 10.0,
            top: context.mediaQuery.padding.left + 6.0,
            bottom: context.mediaQuery.padding.left + 6.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.search,
                size: 25.h,
              ),
              SizedBox(width: 8.w),
              Text(
                'Search for food',
                style: context.theme.inputDecorationTheme.hintStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
