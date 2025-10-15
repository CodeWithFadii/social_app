import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/theme_controller.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/widgets/ui_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = getIt<ThemeController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                Row(
                  spacing: 12.w,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.editProfileScreen);
                      },
                      child: CircleAvatar(
                        radius: 28.h,
                        backgroundImage: AssetImage(AppAssets.personImage),
                      ),
                    ),
                    Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Henry Cavil',
                          style: AppTextStyles.semiBoldPrimary(context, fontSize: 16),
                        ),
                        Text(
                          'Henrycavil97@gmail.com',
                          style: AppTextStyles.regularSecondary(context, fontSize: 14),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      spacing: 6.w,
                      children: [
                        UISvg(svg: AppAssets.star, height: 18.h, color: Color(0xffF5A000)),
                        Text('5.0', style: AppTextStyles.semiBoldPrimary(context, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                25.heightBox,
                Row(
                  spacing: 12.w,
                  children:
                      [
                        [AppAssets.help, 'Help'],
                        [AppAssets.wallet, 'Wallet'],
                        [AppAssets.star, 'Favourites'],
                      ].map((item) {
                        final icon = item[0];
                        final text = item[1];
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (text == 'Help') {
                                Get.toNamed(AppRoutes.helpCenterScreen);
                              }
                              if (text == 'Wallet') {
                                Get.toNamed(AppRoutes.walletScreen);
                              }
                              if (text == 'Favourites') {
                                Get.toNamed(AppRoutes.favouriteProvidersScreen);
                              }
                            },
                            child: Container(
                              height: 100.h,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 8.h,
                                children: [
                                  UISvg(svg: icon, color: context.theme.primaryColor, height: 24.h),
                                  Text(
                                    text,
                                    style: AppTextStyles.regularSecondary(context, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
                20.heightBox,
                Text('General', style: AppTextStyles.semiBoldPrimary(context, fontSize: 18)),
                16.heightBox,
                _buildListItem(
                  onTap: () {
                    Get.toNamed(AppRoutes.notificationScreen);
                  },
                  context,
                  AppAssets.bell,
                  'Notification',
                  'Turn on or off Notification setting',
                ),
                20.heightBox,
                _buildListItem(context, AppAssets.membership, 'Memberships', 'No Membership Plan'),
                20.heightBox,
                _buildListItem(context, AppAssets.agreement, 'Agreements', 'View Agreement Policy'),
                20.heightBox,
                _buildListItem(context, AppAssets.language, 'Language', 'Change App Language'),
                20.heightBox,
                _buildListItem(context, AppAssets.country, 'Country', 'Change Country'),
                20.heightBox,
                _buildListItem(
                  context,
                  AppAssets.theme,
                  'Theme',
                  'Change App theme',
                  onTap: () {
                    _showThemeDialog(context, themeController);
                  },
                ),
                20.heightBox,
                _buildListItem(
                  context,
                  AppAssets.password,
                  'Password',
                  'Set App Password',
                  onTap: () {
                    Get.toNamed(AppRoutes.changePasswordScreen);
                  },
                ),
                20.heightBox,
                _buildListItem(context, AppAssets.logout, 'Logout', null),
                20.heightBox,
                Text('Feedback', style: AppTextStyles.semiBoldPrimary(context, fontSize: 18)),
                20.heightBox,
                _buildListItem(
                  context,
                  AppAssets.feedback,
                  'App Feedback',
                  'Add feedback about app',
                ),
                20.heightBox,
                _buildListItem(
                  context,
                  AppAssets.bug,
                  'Bug Report',
                  'Report any kind of bug or Error',
                ),
                20.heightBox,
                Text('Legals', style: AppTextStyles.semiBoldPrimary(context, fontSize: 18)),
                20.heightBox,
                _buildListItem(
                  context,
                  AppAssets.privacy,
                  'Privacy Policy',
                  null,
                  onTap: () {
                    Get.toNamed(AppRoutes.privacyPolicyScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context,
    String svg,
    String title,
    String? subtitle, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12.w,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: context.theme.textTheme.labelSmall!.color!),
            ),
            child: UISvg(svg: svg, color: context.theme.primaryColor),
          ),
          if (subtitle != null)
            Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.semiBoldPrimary(context, fontSize: 16)),
                Text(
                  subtitle,
                  style: AppTextStyles.regularSecondary(context, fontSize: 13, letterSpacing: 0),
                ),
              ],
            )
          else
            Text(title, style: AppTextStyles.semiBoldPrimary(context, fontSize: 16)),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right_rounded,
            color: context.theme.textTheme.labelSmall!.color,
          ),
        ],
      ),
    );
  }
}

void _showThemeDialog(BuildContext context, ThemeController controller) {
  Get.defaultDialog(
    title: 'Choose Theme',
    titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    titlePadding: EdgeInsets.only(top: 30.h, bottom: 10.h),
    content: Obx(() {
      final selected = controller.themeMode.value;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('Light'),
            value: ThemeMode.light,
            groupValue: selected,
            onChanged: (value) {
              controller.themeMode.value = value!;
              Get.changeThemeMode(value);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark'),
            value: ThemeMode.dark,
            groupValue: selected,
            onChanged: (value) {
              controller.themeMode.value = value!;
              Get.changeThemeMode(value);
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Default'),
            value: ThemeMode.system,
            groupValue: selected,
            onChanged: (value) {
              controller.themeMode.value = value!;
              Get.changeThemeMode(value);
            },
          ),
          UIElevatedButton(
            margin: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
            text: 'Cancel',
            onPressed: () {
              Get.back();
            },
          ),
        ],
      );
    }),
  );
}
