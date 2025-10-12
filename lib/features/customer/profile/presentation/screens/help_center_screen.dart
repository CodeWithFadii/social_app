import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  Center(
                    child: UISvg(
                      svg: AppAssets.backButton,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Help Center',
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
                child: Text('General', style: AppTextStyles.semiBoldPrimary(context, fontSize: 18)),
              ),
              20.heightBox,

              Expanded(
                child: ListView.separated(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final title = [
                      'Help',
                      'Support',
                      'Community & Forums',
                      'Ticket submission',
                      'Terms & Conditions',
                      'Contact Us',
                    ][index];
                    return GestureDetector(
                      onTap: () {
                        if (index == 4) {
                          Get.toNamed(AppRoutes.privacyPolicyScreen);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                        decoration: BoxDecoration(
                          color: context.theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: context.theme.primaryColor.withCustomOpacity(.06),
                              blurRadius: 100,
                              spreadRadius: 0,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              title,
                              style: AppTextStyles.semiBoldPrimary(context, fontSize: 17),
                            ),
                            const Spacer(),
                            Icon(Icons.arrow_forward_ios, size: 18),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8.h),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
