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

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
                    'New Password',
                    style: AppTextStyles.boldPrimary(context, fontSize: 21),
                  ),
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
                    'Enter Password',
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
                26.heightBox,
                ...['At Least One Capital word', 'Use One Creative Word', 'Use Numeric Word'].map((
                  e,
                ) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: Row(
                      spacing: 12.w,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffF0FFEE),
                          ),
                          child: Icon(Icons.check, color: Color(0xff28B915), size: 17),
                        ),
                        Text(e, style: AppTextStyles.regularSecondary(context)),
                      ],
                    ),
                  );
                }),
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
                  Get.toNamed(AppRoutes.personalInfoScreen);
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
