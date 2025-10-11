import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
                    child: UISvg(
                      svg: AppAssets.backButton,
                      onTap: () => Get.back(),
                    ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.primary,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: context.theme.textTheme.titleLarge!.color!,
                unselectedLabelColor: AppColors.textSecondary,
                labelStyle: AppTextStyles.boldPrimary(context, fontSize: 16),
                unselectedLabelStyle: AppTextStyles.regularPrimary(
                  context,
                  fontSize: 16,
                ),
                tabs: [
                  Tab(text: 'Activity'),
                  Tab(text: 'Wallet'),
                ],
              ),
            ),
            30.heightBox,
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildActivityTab(), _buildWalletTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: Text(
          'No activity yet',
          style: AppTextStyles.regularSecondary(context, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildWalletTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withCustomOpacity(.06),
                  blurRadius: 100,
                  spreadRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Available Balance in Your Wallet',
                  style: AppTextStyles.regularSecondary(
                    context,
                    fontSize: 14,
                    letterSpacing: 0,
                    weight: FontWeight.w600,
                  ),
                ),
                12.heightBox,
                Row(
                  children: [
                    Text(
                      '2450',
                      style: AppTextStyles.boldPrimary(context, fontSize: 32),
                    ),
                    Text(
                      '.99',
                      style: AppTextStyles.semiBoldPrimary(
                        context,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'USD',
                      style: AppTextStyles.boldPrimary(context, fontSize: 17),
                    ),
                    Spacer(),
                    Image.asset(
                      AppAssets.authCoins,
                      height: 70.h,
                      width: 120.w,
                    ),
                  ],
                ),
              ],
            ),
          ),
          30.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Banks & Cards',
                style: AppTextStyles.boldPrimary(context, fontSize: 18),
              ),
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.addCardScreen),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 16.sp, color: AppColors.primary),
                      SizedBox(width: 4.w),
                      Text(
                        'Add Cards',
                        style: AppTextStyles.mediumPrimary(
                          context,
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          40.heightBox,
          Image.asset(AppAssets.stackCards),
        ],
      ),
    );
  }

  Widget _buildCreditCard({
    required String cardNumber,
    required String cardHolder,
    required String expiryDate,
    required bool isVisa,
    required bool isTop,
  }) {
    return Container(
      height: 180.h,
      width: 280.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Credit Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  isVisa ? 'VISA' : 'MONO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            20.heightBox,
            Container(
              height: 20.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Center(
                child: Container(
                  height: 15.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD700),
                    borderRadius: BorderRadius.circular(2.r),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                ),
              ),
            ),
            20.heightBox,
            Text(
              cardNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
              ),
            ),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardHolder,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  expiryDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
