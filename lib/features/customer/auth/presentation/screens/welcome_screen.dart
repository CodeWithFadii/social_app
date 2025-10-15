import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';

import '../../../../../core/theme/app_text_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppAssets.welcomeBg), fit: BoxFit.cover),
            ),
          ),
          Container(color: context.theme.scaffoldBackgroundColor.withCustomOpacity(.8)),
          Padding(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Image.asset(AppAssets.welcomePersons, fit: BoxFit.cover, width: double.infinity),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    'Logo',
                    style: AppTextStyles.regularPrimary(
                      context,
                    ).copyWith(fontFamily: GoogleFonts.pacifico().fontFamily, fontSize: 55),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: context.theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      spacing: 6.h,
                      children: [
                        Text(
                          'Get Started',
                          style: AppTextStyles.boldPrimary(context, fontSize: 18),
                        ),
                        SizedBox(height: 4.h),
                        UIElevatedButton(
                          text: 'Continue',
                          onPressed: () {
                            Get.toNamed(AppRoutes.signInScreen);
                          },
                        ),
                        UIElevatedButton(
                          text: 'Skip',
                          onPressed: () {
                            Get.offAllNamed(AppRoutes.dashboardScreen);
                          },
                          textColor: AppColors.black,
                          backgroundColor: AppColors.secondary,
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
