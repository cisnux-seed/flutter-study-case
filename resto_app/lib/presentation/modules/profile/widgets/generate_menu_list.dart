import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/models/model_detail_menu.dart';
import 'card_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenerateMenuList extends StatelessWidget {
  const GenerateMenuList({
    required this.detailMenu,
    required this.menuPicture,
  });

  final List<DetailMenu> detailMenu;
  final String menuPicture;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => CardMenu(
          widthCard: context.width * 0.45,
          menuPicture: menuPicture,
          name: detailMenu[index].name,
        ),
        separatorBuilder: (_, index) => SizedBox(width: 10.w),
        itemCount: detailMenu.length,
      ),
    );
  }
}
