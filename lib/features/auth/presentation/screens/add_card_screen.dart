import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';
import 'package:social_app/core/widgets/ui_svg.dart';
import 'package:social_app/core/widgets/ui_textfield.dart';

import '../../../../core/utils/custom_check_box.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _holderNameController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Center(
                    child: UISvg(svg: AppAssets.backButton, onTap: () => Get.back()),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Wallet',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                ],
              ),
            ),
            30.heightBox,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    Image.asset(AppAssets.stackCards),
                    30.heightBox,
                    Text(
                      'Card Details',
                      style: AppTextStyles.semiBoldPrimary(context, fontSize: 17),
                    ),
                    10.heightBox,
                    Divider(),
                    10.heightBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name', style: AppTextStyles.semiBoldPrimary(context, fontSize: 15)),
                        8.heightBox,
                        UITextField(
                          controller: _cardNumberController,
                          hint: 'Henrycavil@gmail.com',
                          onChanged: (value) => setState(() {}),
                        ),
                      ],
                    ),
                    16.heightBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card Number',
                          style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                        ),
                        8.heightBox,
                        UITextField(
                          controller: _cardNumberController,
                          hint: 'xxxx xxxx  xxxx xxxx',
                          onChanged: (value) => setState(() {}),
                        ),
                      ],
                    ),
                    16.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expiry ',
                                style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                              ),
                              8.heightBox,
                              UITextField(
                                controller: _cardNumberController,
                                hint: 'xxxx',
                                onChanged: (value) => setState(() {}),
                              ),
                            ],
                          ),
                        ),
                        16.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CCV',
                                style: AppTextStyles.semiBoldPrimary(context, fontSize: 15),
                              ),
                              8.heightBox,
                              UITextField(
                                controller: _cardNumberController,
                                hint: '22323',
                                onChanged: (value) => setState(() {}),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    30.heightBox,
                    Row(
                      spacing: 8.w,
                      children: [
                        CustomCheckBox(isChecked: false, onChanged: (value) {}),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'By Placing an “Order” you certify that you agree to our ',
                              style: AppTextStyles.mediumPrimary(
                                context,
                                fontSize: 14,
                                color: context.theme.textTheme.labelSmall!.color,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Privacy policy',
                                  style: AppTextStyles.mediumPrimary(
                                    context,
                                    fontSize: 14,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: AppTextStyles.mediumPrimary(
                                    context,
                                    fontSize: 14,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    16.heightBox,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              16.heightBox,
              UIElevatedButton(
                text: 'Add Card',
                onPressed: () {
                  Get.toNamed(AppRoutes.enableLocationScreen);
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
