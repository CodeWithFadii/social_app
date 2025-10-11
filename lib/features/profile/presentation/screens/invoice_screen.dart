import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Center(
                    child: UISvg(
                      svg: AppAssets.backButton,
                      onTap: () => Get.back(),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Invoice',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  Center(
                    child: UISvg(svg: AppAssets.listButon, onTap: () {}),
                  ),
                ],
              ),
              40.heightBox,
              Text(
                'Invoice',
                style: AppTextStyles.boldPrimary(context, fontSize: 18),
              ),
              16.heightBox,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: context.theme.primaryColor.withCustomOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        spacing: 8.w,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invoice ID',
                            style: AppTextStyles.boldPrimary(
                              context,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '#4544554',
                            style: AppTextStyles.regularSecondary(
                              context,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'Unpaid',
                        style: AppTextStyles.mediumPrimary(
                          context,
                          fontSize: 12,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                'Details',
                style: AppTextStyles.boldPrimary(context, fontSize: 18),
              ),
              16.heightBox,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    UISvg(
                      svg: AppAssets.coupen,
                      height: 24.h,
                      width: 24.w,
                      color: AppColors.primary,
                    ),
                    8.widthBox,
                    Text(
                      'Coupon Applied',
                      style: AppTextStyles.mediumPrimary(
                        context,
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Remove',
                      style: AppTextStyles.mediumPrimary(
                        context,
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: context.theme.primaryColor.withCustomOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildChargeItem(context, 'Service Charges', '\$120'),
                    _buildChargeItem(context, 'Materials Used', '\$200'),
                    _buildChargeItem(context, 'Pipes Used', '\$80'),
                    _buildChargeItem(context, 'Sealant & Tape Used', '\$50'),
                    _buildChargeItem(context, 'Tap Replacement', '\$30'),
                    _buildChargeItem(context, 'Additional Charge', '\$10'),
                    _buildChargeItem(context, 'Taxes & More', '\$20'),
                    16.heightBox,
                    Divider(color: AppColors.border),
                    16.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grand Total',
                          style: AppTextStyles.boldPrimary(
                            context,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '\$350',
                          style: AppTextStyles.boldPrimary(
                            context,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChargeItem(BuildContext context, String title, String amount) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.regularPrimary(context, fontSize: 14),
          ),
          Text(
            amount,
            style: AppTextStyles.mediumPrimary(context, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
