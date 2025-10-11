import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_country_picker.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/ui_elevated_button.dart';
import '../../../../core/widgets/ui_svg.dart';
import '../../../../core/widgets/ui_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  UISvg(svg: AppAssets.edit, height: 26.h),
                ],
              ),
              50.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Name', style: AppTextStyles.semiBoldPrimary(context, fontSize: 15)),
              ),
              14.heightBox,
              UITextField(hint: 'George Conway'),
              20.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Phone Number',
                  style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                ),
              ),
              14.heightBox,
              UITextField(hint: '+1(917)1232354', leading: UICountryPicker()),
              20.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Address', style: AppTextStyles.semiBoldPrimary(context, fontSize: 15)),
              ),
              14.heightBox,
              UITextField(hint: 'Downtown street 67 Near Maze Bank'),
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
                text: 'Update Profile',
                onPressed: () {
                  Get.back();
                },
              ),
              8.heightBox,
              UIElevatedButton(
                text: 'Cancle',
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
