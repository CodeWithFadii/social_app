import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/config/app_config.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';
import 'package:social_app/core/widgets/ui_textfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              20.heightBox,
              Row(
                spacing: 12.w,
                children: [
                  CircleAvatar(radius: 28.h, backgroundImage: AssetImage(AppAssets.personImage)),
                  Column(
                    spacing: 4.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Franciscoagero',
                        style: AppTextStyles.semiBoldPrimary(context, fontSize: 16),
                      ),
                      Row(
                        spacing: 4.w,
                        children: [
                          Text(
                            'Street 2, Santigo...',
                            style: AppTextStyles.regularSecondary(context, fontSize: 14),
                          ),
                          UISvg(svg: AppAssets.marker, height: 16.h),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  UISvg(
                    svg: AppAssets.notifications,
                    height: 40.h,
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationScreen);
                    },
                  ),
                ],
              ),
              25.heightBox,
              UITextField(
                hint: 'Search Services',
                leading: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: UISvg(
                    svg: AppAssets.search,
                    height: 20.h,
                    color: context.theme.primaryColor,
                  ),
                ),
                trailing: Row(
                  children: [
                    SizedBox(height: 28.h, child: VerticalDivider()),
                    Padding(
                      padding: EdgeInsets.only(right: 8.w, left: 8.w),
                      child: UISvg(
                        svg: AppAssets.filter,
                        height: 16.h,
                        color: context.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              25.heightBox,
              Expanded(
                child: Container(
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
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                        decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Row(
                          spacing: 10.w,
                          children: [
                            CircleAvatar(
                              radius: 22.h,
                              backgroundImage: AssetImage(AppAssets.personImage),
                            ),
                            Column(
                              spacing: 4.h,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AI Assistant',
                                  style: AppTextStyles.semiBoldPrimary(
                                    context,
                                    fontSize: 16,
                                    color: context.theme.scaffoldBackgroundColor,
                                  ),
                                ),
                                Text(
                                  'Active now',
                                  style: AppTextStyles.regularSecondary(
                                    context,
                                    fontSize: 14,
                                    color: context.theme.scaffoldBackgroundColor,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            UISvg(
                              svg: AppAssets.list,
                              height: 18.h,
                              color: context.theme.scaffoldBackgroundColor,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 260.w,
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                child: Column(
                                  spacing: 2.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'AI Assistant',
                                      style: AppTextStyles.semiBoldPrimary(
                                        context,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'How can I Help you?',
                                          style: AppTextStyles.regularPrimary(
                                            context,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          '09:25 AM',
                                          style: AppTextStyles.regularSecondary(
                                            context,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: context.theme.scaffoldBackgroundColor,
                          ),

                          child: UITextField(
                            hint: 'Write your message',
                            leading: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: UISvg(
                                svg: AppAssets.camera,
                                height: 20.h,
                                color: context.theme.primaryColor,
                              ),
                            ),
                            trailing: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: UISvg(
                                svg: AppAssets.send,
                                height: 16.h,
                                color: context.theme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              8.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
