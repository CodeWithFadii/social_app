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

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/ui_elevated_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                SizedBox(height: 40.h),
                Text(
                  'Create an account',
                  style: AppTextStyles.semiBoldPrimary(context, fontSize: 20),
                ),
                50.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                  ),
                ),
                14.heightBox,
                UITextField(
                  hint: '+1(917)1232354',
                  leading: SizedBox(child: UICountryPicker()),
                ),
                14.heightBox,
                Row(
                  spacing: 8.w,
                  children: [
                    CustomCheckBox(isChecked: false, onChanged: (value) {}),
                    Text(
                      'I agree with terms and conditions',
                      style: AppTextStyles.regularSecondary(context, fontSize: 14),
                    ),
                  ],
                ),
                26.heightBox,
                UIElevatedButton(
                  text: 'Continue',
                  onPressed: () {
                    Get.toNamed(AppRoutes.otpVerificationScreen);
                  },
                ),
                40.heightBox,
                Text('OR', style: AppTextStyles.regularSecondary(context, fontSize: 14)),
                40.heightBox,
                UIElevatedButton(
                  text: 'Continue With Apple',
                  backgroundColor: Color(0xff676767),
                  leading: UISvg(svg: AppAssets.apple, height: 20.h, width: 20.w),
                  textColor: AppColors.white,
                  onPressed: () {
                    // Get.toNamed(AppRoutes.signInScreen);
                  },
                ),
                8.heightBox,
                UIElevatedButton(
                  text: 'Continue with Email',
                  leading: UISvg(
                    svg: AppAssets.mail,
                    height: 18.h,
                    width: 18.w,
                    color: context.theme.scaffoldBackgroundColor,
                  ),
                  onPressed: () {
                    // Get.toNamed(AppRoutes.signInScreen);
                  },
                ),
                8.heightBox,
                UIElevatedButton(
                  text: 'Continue with Google',
                  backgroundColor: AppColors.secondary,
                  leading: UISvg(svg: AppAssets.google, height: 18.h, width: 18.w),
                  textColor: AppColors.black,
                  onPressed: () {
                    // Get.toNamed(AppRoutes.signInScreen);
                  },
                ),
                26.heightBox,
                Divider(),
                26.heightBox,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Find my',
                        style: AppTextStyles.regularPrimary(context, fontSize: 16),
                      ),
                      TextSpan(
                        text: ' Account',
                        style: AppTextStyles.boldPrimary(
                          context,
                          fontSize: 16,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
