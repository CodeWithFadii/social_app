import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool isPrivacyExpanded = true;
  bool isTermsExpanded = true;
  bool isLicensesExpanded = true;

  final bool isOnboarding = Get.arguments?['isOnboarding'] ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Center(
                    child: UISvg(svg: AppAssets.backButton, onTap: () => Get.back()),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Privacy Policy',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  Center(child: UISvg(svg: AppAssets.listButon)),
                ],
              ),
              30.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Privacy Policy & Legals',
                  style: AppTextStyles.boldPrimary(context, fontSize: 18),
                ),
              ),
              20.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildExpandableCard(
                        title: 'Privacy Policy',
                        description:
                            'Our Privacy Policy outlines how we collect, use, and protect your personal information when you use our services. We are committed to safeguarding your privacy and ensuring that your data remains secure.',
                        isExpanded: isPrivacyExpanded,
                        onTap: () => setState(() => isPrivacyExpanded = !isPrivacyExpanded),
                      ),
                      16.heightBox,
                      _buildExpandableCard(
                        title: 'Terms & Services',
                        description:
                            'Our Terms & Services (also known as Terms of Use or Terms and Conditions) govern your access to and use of our platform. By using our services, you agree to follow the rules and guidelines in these terms.',
                        isExpanded: isTermsExpanded,
                        onTap: () => setState(() => isTermsExpanded = !isTermsExpanded),
                      ),
                      16.heightBox,
                      _buildExpandableCard(
                        title: 'Licenses & Acknowledgement',
                        description:
                            'This section outlines the software licenses, third-party tools, libraries, and assets we use in our platform, along with proper acknowledgements to their creators. We value transparency and give credit. We gratefully acknowledge the developers, designers, and organizations behind the technologies and resources integrated into our platform. Some notable acknowledgements include the Flutter framework, Google Fonts, and various open-source libraries that make our app possible.',
                        isExpanded: isLicensesExpanded,
                        onTap: () => setState(() => isLicensesExpanded = !isLicensesExpanded),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: !isOnboarding
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    16.heightBox,
                    UIElevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Get.toNamed(AppRoutes.walletScreen, arguments: {'isOnboarding': true});
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

  Widget _buildExpandableCard({
    required String title,
    required String description,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withCustomOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(title, style: AppTextStyles.boldPrimary(context, fontSize: 16)),
                  ),
                  AnimatedRotation(
                    turns: !isExpanded ? 0.5 : 0,
                    duration: Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColors.textSecondary,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              if (isExpanded) ...[
                12.heightBox,
                Text(description, style: AppTextStyles.regularSecondary(context, fontSize: 14)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
