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

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  Center(
                    child: UISvg(
                      svg: AppAssets.backButton,
                      color: context.theme.scaffoldBackgroundColor,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Orders',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  Center(child: UISvg(svg: AppAssets.listButon)),
                ],
              ),
              30.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Showing Results',
                  style: AppTextStyles.semiBoldPrimary(
                    context,
                    fontSize: 18,
                    color: context.theme.textTheme.labelSmall!.color,
                  ),
                ),
              ),
              20.heightBox,

              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.orderDetailsScreen);
                      },
                      child: Container(
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
                                  backgroundImage: AssetImage(AppAssets.plumbingBg),
                                ),
                                10.widthBox,
                                Column(
                                  spacing: 5.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Plumbing Services',
                                      style: AppTextStyles.regularPrimary(
                                        context,
                                        weight: FontWeight.w900,
                                        fontSize: 15,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Provided by ',
                                        style: AppTextStyles.regularPrimary(
                                          context,
                                        ).copyWith(fontSize: 12.sp),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Henry Cavil',
                                            style: AppTextStyles.regularPrimary(
                                              context,
                                              fontSize: 11,
                                              weight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      spacing: 4.w,
                                      children: [
                                        UISvg(svg: AppAssets.clock, height: 16.h),
                                        Text(
                                          'Reached Within 30 Mints',
                                          style: AppTextStyles.regularPrimary(
                                            context,
                                            fontSize: 11,
                                            color: Color(0xff28B915),
                                          ),
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFF5EB),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'Running',
                                        style: AppTextStyles.regularPrimary(
                                          context,
                                          color: Color(0xffF77B00),
                                          weight: FontWeight.w600,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      spacing: 4.w,
                                      children: [
                                        UISvg(svg: AppAssets.calender, height: 16.h),
                                        Text(
                                          '16 / 06 / 2025',
                                          style: AppTextStyles.regularPrimary(
                                            context,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$120',
                                      style: AppTextStyles.regularPrimary(
                                        context,
                                        weight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      'View Detail',
                                      style: AppTextStyles.regularSecondary(context),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.favouriteProvidersScreen);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: context.theme.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Order Again',
                                      style: AppTextStyles.regularPrimary(
                                        context,
                                        color: context.theme.scaffoldBackgroundColor,
                                        weight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                10.widthBox,
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.rateServiceScreen);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: AppColors.secondary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: UISvg(svg: AppAssets.star, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.h),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
