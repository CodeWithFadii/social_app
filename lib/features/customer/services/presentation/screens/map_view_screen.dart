import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.map,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            color: AppColors.black.withCustomOpacity(.3),
            colorBlendMode: BlendMode.darken,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: UISvg(svg: AppAssets.backButton),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Map View',
                            style: AppTextStyles.boldPrimary(context, fontSize: 18),
                          ),
                        ),
                      ),
                      Center(
                        child: UISvg(svg: AppAssets.notifications, height: 36.h),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      color: context.theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: context.theme.primaryColor.withCustomOpacity(.06),
                          blurRadius: 100,
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      spacing: 10.h,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.h,
                              backgroundImage: AssetImage(AppAssets.personImage),
                            ),
                            10.widthBox,
                            Column(
                              spacing: 4.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Steve Smith',
                                  style: AppTextStyles.regularPrimary(
                                    context,
                                    weight: FontWeight.w900,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Service Provider',
                                  style: AppTextStyles.regularSecondary(context, fontSize: 12),
                                ),
                                Row(
                                  spacing: 4.w,
                                  children: [
                                    UISvg(
                                      svg: AppAssets.marker,
                                      height: 16.h,
                                      color: context.theme.primaryColor,
                                    ),
                                    Text(
                                      '1.3km Away From You',
                                      style: AppTextStyles.regularPrimary(context, fontSize: 11),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              spacing: 6.h,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                  decoration: BoxDecoration(
                                    color: Color(0xff28B915),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    'Plumbing',
                                    style: AppTextStyles.regularPrimary(
                                      context,
                                      color: AppColors.white,
                                      weight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                Row(
                                  spacing: 5.w,
                                  children: [
                                    UISvg(
                                      svg: AppAssets.star,
                                      height: 14.h,
                                      color: Color(0xffE4B300),
                                    ),
                                    Text(
                                      '5.0',
                                      style: AppTextStyles.regularPrimary(context, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        UIElevatedButton(
                          text: 'View Profile',
                          onPressed: () {
                            Get.toNamed(AppRoutes.providerProfileScreen);
                          },
                          backgroundColor: AppColors.secondary,
                          textColor: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
