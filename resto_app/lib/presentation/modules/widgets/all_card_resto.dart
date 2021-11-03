import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resto_app/presentation/modules/utils/get_rating_stars.dart';
import 'package:resto_app/presentation/modules/utils/resto_image_format.dart';

class AllCardResto extends StatelessWidget {
  const AllCardResto({
    required this.restaurant,
    required this.onTap,
  });

  final Restaurant restaurant;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            CachedNetworkImage(
              imageUrl: RestoImageFormat.mediumImage(restaurant.pictureId),
              imageBuilder: (_, imageProvider) => Container(
                alignment: Alignment.centerLeft,
                width: context.width * 0.24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      context.theme.colorScheme.secondary.withOpacity(0.2),
                      BlendMode.darken,
                    ),
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (_, __) => Container(
                width: context.width * 0.24,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(
                  Icons.image_rounded,
                  size: context.height * 0.1,
                  color: Colors.white,
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                width: context.width * 0.24,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: context.height * 0.1,
                  color: Colors.white,
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
                  Text(
                    restaurant.name,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: context.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    restaurant.city.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: context.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  RatingBar(
                    itemSize: 16.h,
                    initialRating: getRatingStars(restaurant.rating),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star_rounded, color: Colors.amber),
                      half: Icon(Icons.star_half_rounded, color: Colors.amber),
                      empty: Icon(
                        Icons.star_border_rounded,
                        color: Colors.amber,
                      ),
                    ),
                    onRatingUpdate: (_) {},
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
