import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/otp_timer_widget.dart';
import '../../../../core/widgets/ui_elevated_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55.w,
      height: 55.w,
      textStyle: TextStyle(fontSize: 22.sp, color: Colors.black),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verify your Email',
                  style: AppTextStyles.semiBoldPrimary(context, fontSize: 20),
                ),
                50.heightBox,
                Text(
                  textAlign: TextAlign.center,
                  '''An authorization code hase been\nsend to your provided Email Address''',
                  style: AppTextStyles.regularSecondary(context, fontSize: 14.5),
                ),
                30.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Code',
                    style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                  ),
                ),
                16.heightBox,
                // ✅ Custom OTP Input
                Pinput(
                  length: 6,
                  showCursor: true,
                  obscureText: true,
                  obscuringWidget: Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                  ),
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: Colors.transparent),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme,
                  onCompleted: (pin) {
                    debugPrint('Entered PIN: $pin');
                  },
                ),

                26.heightBox,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'I don’t recieve code',
                        style: AppTextStyles.regularSecondary(
                          context,
                          fontSize: 15,
                          letterSpacing: 0,
                        ),
                      ),
                      TextSpan(
                        text: '  Resend Code',
                        style: AppTextStyles.boldPrimary(
                          context,
                          fontSize: 15,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                16.heightBox,
                Text(
                  '01:18 sec left',
                  style: AppTextStyles.regularSecondary(context, fontSize: 14),
                ),
                34.heightBox,
                OtpTimerWidget(
                  duration: 90,
                  size: 80,
                  strokeWidth: 6,
                  backgroundColor: AppColors.secondary,
                  progressColor: AppColors.black,
                  onCompleted: () {
                    debugPrint("OTP time expired");
                  },
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
                  Get.toNamed(AppRoutes.newPasswordScreen);
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
