import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
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

class ProviderLoginScreen extends StatelessWidget {
  const ProviderLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 80.w,
      height: 80.w,
      textStyle: TextStyle(fontSize: 22.sp, color: Colors.black),
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Text('LOGIN', style: AppTextStyles.semiBoldPrimary(context, fontSize: 20)),
                50.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Phone Number',
                    style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                  ),
                ),
                14.heightBox,
                UITextField(
                  hint: '+1(917)1232354',
                  leading: SizedBox(child: UICountryPicker()),
                ),
                20.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your Pin Code',
                    style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                  ),
                ),
                14.heightBox,
                Pinput(
                  length: 4,
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
                20.heightBox,
                Text('Or', style: AppTextStyles.regularSecondary(context, fontSize: 14)),
                Text(
                  'Login with Biometric',
                  style: AppTextStyles.regularSecondary(context, fontSize: 14),
                ),
                60.heightBox,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    spacing: 20.w,
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 5.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enabled biometric Access',
                              style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                            ),
                            Text(
                              'Login quickly and securely with the fingerprint stored on this device',
                              style: AppTextStyles.regularSecondary(context, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      UISvg(svg: AppAssets.fingerPrint),
                    ],
                  ),
                ),

                Spacer(),
                UIElevatedButton(
                  text: 'Login',
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.providerDashboardScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
