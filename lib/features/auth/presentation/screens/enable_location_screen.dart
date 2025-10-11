import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.authMap),
                    40.heightBox,
                    Text(
                      'Enable Location Access',
                      style: AppTextStyles.boldPrimary(context, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    16.heightBox,
                    Text(
                      'Enable your Location so that service Provider can view your location & Reach to you Early',
                      style: AppTextStyles.regularSecondary(context, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
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
                text: 'Allow',
                onPressed: () {
                  Get.toNamed(AppRoutes.personalInfoScreen);
                },
              ),
              8.heightBox,
              UIElevatedButton(
                text: 'Deny',
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
