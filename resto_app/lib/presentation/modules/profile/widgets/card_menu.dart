import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({
    required this.name,
    required this.menuPicture,
    required this.widthCard,
  });

  final String name;
  final String menuPicture;
  final double widthCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: widthCard,
      child: CachedNetworkImage(
        imageUrl: menuPicture,
        imageBuilder: (_, imageProvider) => Container(
          padding: EdgeInsets.only(
            left: context.mediaQuery.padding.left + 10.0,
            right: context.mediaQuery.padding.right + 20.0,
            bottom: context.mediaQuery.padding.bottom + 10.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                context.theme.colorScheme.secondary.withOpacity(0.25),
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  name,
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
                'Rp 10.000',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: context.textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4.h),
              RatingBar(
                itemSize: 16.h,
                initialRating: 4.5,
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
            size: 100.h,
            color: Colors.white,
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
            size: 100.h,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
