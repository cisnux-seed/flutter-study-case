import 'package:resto_app/presentation/modules/profile/widgets/generate_review_list.dart';
import 'package:resto_app/presentation/modules/profile/widgets/generate_menu_list.dart';
import 'package:resto_app/presentation/modules/utils/get_rating_stars.dart';
import 'package:resto_app/presentation/modules/utils/resto_image_format.dart';
import 'package:resto_app/presentation/modules/widgets/generate_horizontal_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../controller/resto_profile_controller.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestoProfileView extends GetView<RestoProfileContoller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.profileRestoState == ProfileRestoState.Loading
            ? Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : NestedScrollView(
                headerSliverBuilder: (_, isScrolled) => [
                  SliverAppBar(
                    pinned: false,
                    leading: Padding(
                      padding: EdgeInsets.only(
                        left: context.mediaQuery.padding.left + 16.0,
                      ),
                      child: CircleAvatar(
                        backgroundColor: context.theme.colorScheme.secondary
                            .withOpacity(0.2),
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20.h,
                          ),
                        ),
                      ),
                    ),
                    foregroundColor: context.theme.primaryColor,
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: context.mediaQuery.padding.right + 16.0,
                        ),
                        child: CircleAvatar(
                          backgroundColor: context.theme.colorScheme.secondary
                              .withOpacity(0.2),
                          child: Obx(
                            () => IconButton(
                              onPressed: () => controller.isFavoriteResto
                                  ? controller.removeFavoriteResto()
                                  : controller.addFavoriteResto(),
                              icon: controller.isFavoriteResto
                                  ? Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 20.h,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 20.h,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    backgroundColor: context.theme.primaryColor,
                    expandedHeight: context.height * 0.3,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CachedNetworkImage(
                        colorBlendMode: BlendMode.darken,
                        color: context.theme.colorScheme.secondary
                            .withOpacity(0.2),
                        fit: BoxFit.cover,
                        imageUrl: RestoImageFormat.largeImage(
                          controller.restaurant.pictureId,
                        ),
                        placeholder: (_, __) => Icon(
                          Icons.image_rounded,
                          color: Colors.white,
                          size: context.height * 0.2,
                        ),
                        errorWidget: (_, __, ___) => Icon(
                          Icons.error_outline_rounded,
                          color: Colors.white,
                          size: context.height * 0.2,
                        ),
                      ),
                      titlePadding: EdgeInsets.only(
                        left: context.mediaQuery.padding.left + 16.0,
                        bottom: context.mediaQuery.padding.bottom + 16.0,
                      ),
                    ),
                  ),
                ],
                body: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: context.mediaQuery.padding.left + 16,
                        right: context.mediaQuery.padding.right + 16,
                        bottom: context.mediaQuery.padding.bottom + 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.restaurant.name,
                            textAlign: TextAlign.left,
                            style: context.textTheme.headline4,
                          ),
                          SizedBox(height: 10.h),
                          Material(
                            elevation: 4.0,
                            color: context.theme.primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Table(
                                    columnWidths: {
                                      1: const FractionColumnWidth(0.65),
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              'Description',
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: ReadMoreText(
                                              controller.restaurant.description,
                                              textAlign: TextAlign.justify,
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                              colorClickableText: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              'Rating',
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: RatingBar(
                                              itemSize: 18.h,
                                              initialRating: getRatingStars(
                                                  controller.restaurant.rating),
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                full: Icon(Icons.star_rounded,
                                                    color: Colors.amber),
                                                half: Icon(
                                                    Icons.star_half_rounded,
                                                    color: Colors.amber),
                                                empty: Icon(
                                                  Icons.star_border_rounded,
                                                  color: Colors.amber,
                                                ),
                                              ),
                                              onRatingUpdate: (_) {},
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              'Category',
                                              textAlign: TextAlign.left,
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              controller.restaurant.category
                                                  .map(
                                                    (category) => category.name,
                                                  )
                                                  .toList()
                                                  .join(', '),
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              'City',
                                              textAlign: TextAlign.left,
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: Text(
                                              controller.restaurant.city
                                                  .toString(),
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              'Address',
                                              textAlign: TextAlign.left,
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              controller.restaurant.address
                                                  .toString(),
                                              style: context
                                                  .textTheme.bodyText1!
                                                  .copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Foods',
                            style: context.textTheme.headline4,
                          ),
                          SizedBox(height: 10.h),
                          GenerateMenuList(
                            detailMenu: controller.restaurant.menus.foods,
                            menuPicture:
                                'https://cdn.pixabay.com/photo/2018/10/22/22/18/steak-3766548_960_720.jpg',
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Drinks',
                            style: context.textTheme.headline4,
                          ),
                          SizedBox(height: 10.h),
                          GenerateMenuList(
                            detailMenu: controller.restaurant.menus.drinks,
                            menuPicture:
                                'https://cdn.pixabay.com/photo/2015/09/09/17/42/coffee-932103_960_720.jpg',
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Reviews',
                            style: context.textTheme.headline4,
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              bottom: 12.0,
                              top: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: context.theme.primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextField(
                                  controller: controller.usernameController,
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline6,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    focusedBorder: InputBorder.none,
                                    hintText: 'Username',
                                    hintStyle: context
                                        .theme.inputDecorationTheme.hintStyle,
                                  ),
                                ),
                                TextField(
                                  controller: controller.reviewController,
                                  textAlign: TextAlign.start,
                                  style: context.textTheme.headline6,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    hintText: 'Review',
                                    hintStyle: context
                                        .theme.inputDecorationTheme.hintStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: context.width * 0.2,
                                  child: ElevatedButton(
                                    onPressed: () => controller.postRestoReview(
                                      name: controller.usernameController.text,
                                      review: controller.reviewController.text,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          context.theme.colorScheme.secondary,
                                    ),
                                    child: Text(
                                      'Post',
                                      style: context.textTheme.bodyText1!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                          controller.postReviewState == PostReviewState.Success
                              ? GenerateListReview(
                                  customerReviews: controller.customerReviews,
                                )
                              : GenerateHorizontalShimmer(
                                  height: context.height * 0.35,
                                  width: context.width * 0.45,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
