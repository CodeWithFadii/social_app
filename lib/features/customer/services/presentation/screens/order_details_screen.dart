import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/ui_svg.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double imageHeight = MediaQuery.of(context).size.height * 0.4;
    double bottomHeight = MediaQuery.of(context).size.height * 0.62;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: imageHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.bgExample1),
                colorFilter: ColorFilter.mode(
                  Colors.black.withCustomOpacity(0.40),
                  BlendMode.darken,
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  children: [
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
                              'Order Details',
                              style: AppTextStyles.boldPrimary(
                                context,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Center(child: UISvg(svg: AppAssets.listButon)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

              height: bottomHeight,
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Provider',
                    style: AppTextStyles.regularPrimary(
                      context,
                      weight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  15.heightBox,
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
                                Row(
                                  spacing: 4.w,
                                  children: [
                                    Text(
                                      'Alec Benjamin',
                                      style: AppTextStyles.regularPrimary(
                                        context,
                                        weight: FontWeight.w900,
                                        fontSize: 15,
                                      ),
                                    ),
                                    UISvg(svg: AppAssets.verify),
                                  ],
                                ),
                                Text(
                                  'Service Provider',
                                  style: AppTextStyles.regularSecondary(context, fontSize: 12),
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
                                    'Electrician',
                                    style: AppTextStyles.regularPrimary(
                                      context,
                                      color: AppColors.white,
                                      weight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  spacing: 5.w,
                                  children: [
                                    UISvg(svg: AppAssets.caseIcon, height: 14.h),
                                    Text(
                                      '5+ Years of Experience',
                                      style: AppTextStyles.regularPrimary(context, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  15.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Image attach by User',
                        style: AppTextStyles.regularPrimary(
                          context,
                          weight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      Text('See All', style: AppTextStyles.regularSecondary(context, fontSize: 15)),
                    ],
                  ),
                  15.heightBox,
                  SizedBox(
                    height: 120.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppAssets.acBg),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10.w),
                    ),
                  ),
                  15.heightBox,

                  TimeDisplay(),
                  Spacer(),
                  UIElevatedButton(
                    text: 'Chat',
                    onPressed: () {
                      Get.toNamed(AppRoutes.chatScreen);
                    },
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

class TimeDisplay extends StatelessWidget {
  const TimeDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Order Expire Time',
            style: AppTextStyles.regularPrimary(context, weight: FontWeight.w700, fontSize: 17),
          ),
        ),
        10.heightBox,
        Row(
          children: [
            // HOURS
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_buildDigit(context, '0'), _buildDigit(context, '1')],
                  ),
                  6.h.heightBox,
                  Text('Hours', style: AppTextStyles.regularSecondary(context, fontSize: 14)),
                ],
              ),
            ),

            // MINUTES
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_buildDigit(context, '0'), _buildDigit(context, '4')],
                  ),
                  6.h.heightBox,
                  Text('Minutes', style: AppTextStyles.regularSecondary(context, fontSize: 14)),
                ],
              ),
            ),

            // SECONDS
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [_buildDigit(context, '1'), _buildDigit(context, '1')],
                  ),
                  6.h.heightBox,
                  Text('Seconds', style: AppTextStyles.regularSecondary(context, fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDigit(BuildContext context, String digit) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        digit,
        style: AppTextStyles.boldPrimary(context, fontSize: 18, color: AppColors.black),
      ),
    );
  }
}
