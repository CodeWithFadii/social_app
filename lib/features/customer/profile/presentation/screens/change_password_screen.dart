import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';
import 'package:social_app/core/widgets/ui_textfield.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/ui_elevated_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  spacing: 16.w,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: UISvg(svg: AppAssets.backButton),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Change Password',
                        style: AppTextStyles.boldPrimary(context, fontSize: 21),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80.h),
                Text(
                  'Create New Password',
                  style: AppTextStyles.semiBoldPrimary(context, fontSize: 18),
                ),
                50.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Current Password',
                    style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                  ),
                ),
                14.heightBox,
                UITextField(
                  hint: '*********',
                  leading: UISvg(
                    svg: AppAssets.lock,
                    height: 22,
                    color: context.theme.primaryColor,
                  ),
                ),
                18.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter New Password',
                    style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                  ),
                ),
                14.heightBox,
                UITextField(
                  hint: '*********',
                  leading: UISvg(
                    svg: AppAssets.lock,
                    height: 22,
                    color: context.theme.primaryColor,
                  ),
                ),
                18.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                    style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                  ),
                ),
                14.heightBox,
                UITextField(
                  hint: '*********',
                  leading: UISvg(
                    svg: AppAssets.lock,
                    height: 22,
                    color: context.theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIElevatedButton(
                text: 'Confirm',
                onPressed: () {
                  Get.toNamed(AppRoutes.personalInfoScreen);
                },
              ),
              16.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
