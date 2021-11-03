import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:resto_app/data/models/model_restaurant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resto_app/presentation/modules/utils/get_rating_stars.dart';
import 'package:resto_app/presentation/modules/utils/resto_image_format.dart';

class RecommendedCardResto extends StatelessWidget {
  const RecommendedCardResto({
    required this.restaurant,
    required this.onTap,
    required this.widthCard,
  });

  final Restaurant restaurant;
  final Function() onTap;
  final double widthCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: RestoImageFormat.mediumImage(restaurant.pictureId),
        imageBuilder: (_, imageProvider) => Container(
          padding: EdgeInsets.only(
            left: context.mediaQuery.padding.left + 10.0,
            right: context.mediaQuery.padding.right + 50.0,
            bottom: context.mediaQuery.padding.bottom + 10.0,
          ),
          width: widthCard,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: imageProvider,
              colorFilter: ColorFilter.mode(
                context.theme.colorScheme.secondary.withOpacity(0.2),
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                width: widthCard,
                child: Text(
                  restaurant.name,
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: context.textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                restaurant.city.toString(),
                softWrap: true,
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
        placeholder: (_, __) => Container(
          width: widthCard,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.image_rounded,
            color: Colors.white,
            size: 120.h,
          ),
        ),
        errorWidget: (_, __, ___) => Container(
          width: widthCard,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.error_outline_rounded,
            size: 120.h,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
