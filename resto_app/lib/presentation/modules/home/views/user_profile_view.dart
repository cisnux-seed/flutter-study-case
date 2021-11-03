import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resto_app/presentation/modules/home/widgets/user_profile_shimmer.dart';
import '../controllers/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileView extends GetView<UserProfileController> {
  static const label = "Account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (controller.userProfileState == UserProfileState.Loading) {
              return UserProfileShimmer();
            }
            return Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: context.height * 0.08,
                    width: context.width * 0.25,
                    child: CircleAvatar(
                      backgroundColor: context.theme.primaryColor,
                      child: Text(
                        controller.userProfile.username[0].toUpperCase(),
                        style: context.textTheme.headline5,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    controller.userProfile.username,
                    style: context.textTheme.headline5,
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: context.width * 0.9,
                    child: Center(
                      child: Material(
                        color: context.theme.primaryColor,
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(4.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  'Email',
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Text(
                                  controller.currentEmail,
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Daily Promo',
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Switch(
                                  thumbColor: MaterialStateProperty.all(
                                    context.theme.colorScheme.secondary,
                                  ),
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: Colors.grey.shade400,
                                  value: controller.isPromoActive,
                                  onChanged: (value) async {
                                    controller.saveRestoPromoNotif(value);
                                    await controller.scheduledDailyPromo();
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Link With Another Account',
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () async =>
                                      await controller.linkWithGmailAccount(),
                                  icon: Icon(
                                    Icons.link_rounded,
                                    size: context.height * 0.035,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Sign Out',
                                  style: context.textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () async =>
                                      await controller.logout(),
                                  icon: Icon(
                                    Icons.exit_to_app_rounded,
                                    size: context.height * 0.035,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
