import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/custom_check_box.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_country_picker.dart';
import 'package:social_app/core/widgets/ui_svg.dart';
import 'package:social_app/core/widgets/ui_textfield.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/ui_elevated_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create an Account',
                    style: AppTextStyles.boldPrimary(context, fontSize: 21),
                  ),
                ),
                SizedBox(height: 80.h),
                Text(
                  'What’s your Email Address',
                  style: AppTextStyles.semiBoldPrimary(context, fontSize: 18),
                ),
                50.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your Email',
                    style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                  ),
                ),
                14.heightBox,
                UITextField(
                  hint: 'Sample@gmail.com',
                  leading: UISvg(
                    svg: AppAssets.person,
                    height: 30,
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
                text: 'Next',
                onPressed: () {
                  Get.toNamed(AppRoutes.verifyEmailScreen);
                },
              ),
              8.heightBox,
              UIElevatedButton(
                text: 'Back',
                backgroundColor: AppColors.secondary,
                textColor: AppColors.black,
                onPressed: () {
                  Get.back();
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
