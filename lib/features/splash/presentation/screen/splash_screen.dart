import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/utils/extentions.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/ui_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initiateRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(AppRoutes.loginScreen);
  }

  @override
  void initState() {
    super.initState();
    initiateRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.splashGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            100.heightBox,
            UISvg(svg: AppAssets.splashLogo),
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: Column(
                children: [
                  Text(
                    'Powered By',
                    style: AppTextStyles.regularPrimary(context, color: AppColors.white),
                  ),
                  10.heightBox,
                  UISvg(svg: AppAssets.brgLogo),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
