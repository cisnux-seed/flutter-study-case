import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/presentation/modules/widgets/generate_all_resto.dart';
import '/presentation/modules/search/controller/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, context.height * 0.2),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: context.mediaQuery.padding.top - 10.0,
              left: context.mediaQuery.padding.left + 12.0,
              right: context.mediaQuery.padding.right + 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 25.h,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 16.0, right: 6.0),
                    height: context.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.shade300,
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: controller.searchController,
                      textAlign: TextAlign.start,
                      style: context.textTheme.headline6!.copyWith(
                        color: context.theme.colorScheme.secondary,
                      ),
                      maxLines: 1,
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: 'Search for food',
                        hintStyle: context.theme.inputDecorationTheme.hintStyle,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 25.h,
                            color: context.theme.colorScheme.secondary,
                          ),
                          onPressed: () async =>
                              await controller.setRestoBySearch(
                            controller.searchController.text,
                          ),
                        ),
                      ),
                      onSubmitted: (keyword) async =>
                          await controller.setRestoBySearch(keyword),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: context.mediaQuery.padding.top,
          left: context.mediaQuery.padding.left + 16.0,
          right: context.mediaQuery.padding.right + 16.0,
          bottom: context.mediaQuery.padding.bottom + 16.0,
        ),
        child: Obx(
          () {
            if (controller.searchResultState == SearchResultState.HasNoData) {
              return Center(
                child: Text(
                  "Sorry, couldn't find\nany food or restaurant",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline5,
                ),
              );
            } else if (controller.searchResultState ==
                SearchResultState.Loading) {
              return Center(
                child: SizedBox(
                  height: context.height * 0.3,
                  width: context.width * 0.3,
                  child: Lottie.asset(
                    'assets/animation/search_loading.json',
                  ),
                ),
              );
            }
            return GenerateAllResto(restaurants: controller.restoBySearch);
          },
        ),
      ),
    );
  }
}
