import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
            // Top Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  UISvg(svg: AppAssets.backButton, onTap: () => Get.back()),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Notification',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
                    child: Center(
                      child: UISvg(svg: AppAssets.setting, height: 20.h, width: 20.w, onTap: () {}),
                    ),
                  ),
                ],
              ),
            ),
            20.heightBox,

            // TabBar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.primary,
                indicatorWeight: 3,
                labelPadding: EdgeInsets.zero,
                labelColor: context.theme.primaryColor,
                unselectedLabelColor: AppColors.textSecondary,
                labelStyle: AppTextStyles.mediumPrimary(context, fontSize: 16),
                unselectedLabelStyle: AppTextStyles.mediumPrimary(
                  context,
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Read'),
                  Tab(text: 'Unread'),
                ],
              ),
            ),

            22.heightBox,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Showing Results',
                  style: AppTextStyles.regularSecondary(
                    context,
                    fontSize: 16,
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            16.heightBox,

            // TabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // All Notifications
                  _buildNotificationList([
                    _buildNotificationItem(
                      icon: AppAssets.wallet,
                      title: 'Payment Confirmation',
                      subtitle: 'Your Payment was Successful',
                      time: '10 min ago',
                    ),
                    _buildNotificationItem(
                      icon: AppAssets.reminder,
                      title: 'Reminder',
                      subtitle: 'Your Payment was Pending',
                    ),
                    _buildNotificationItem(
                      icon: AppAssets.wallet1,
                      title: 'Order ID #21454',
                      subtitle: 'Your order is on the way',
                    ),
                    _buildNotificationItem(
                      icon: AppAssets.person,
                      title: 'Complete Profile',
                      subtitle: 'Complete your Pending Profile',
                      time: '5 min ago',
                    ),
                  ]),

                  // Read Notifications
                  _buildNotificationList([
                    _buildNotificationItem(
                      icon: AppAssets.wallet,
                      title: 'Payment Confirmation',
                      subtitle: 'Your Payment was Successful',
                      time: '30 min ago',
                    ),
                    _buildNotificationItem(
                      icon: AppAssets.reminder,
                      title: 'Reminder',
                      subtitle: 'Subscription renewed successfully',
                    ),
                  ]),

                  // Unread Notifications
                  _buildNotificationList([
                    _buildNotificationItem(
                      icon: AppAssets.person,
                      title: 'New Message',
                      subtitle: 'Martin Smith sent you a message',
                      time: '2 min ago',
                    ),
                    _buildNotificationItem(
                      icon: AppAssets.wallet1,
                      title: 'Order ID #24111',
                      subtitle: 'Your order is ready for pickup',
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Notification list builder
  Widget _buildNotificationList(List<Widget> items) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      children: items,
    );
  }

  /// Notification item widget
  Widget _buildNotificationItem({
    required String icon,
    required String title,
    required String subtitle,
    String? time,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: context.theme.primaryColor.withCustomOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 45.h,
            height: 45.h,
            decoration: BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
            child: Center(
              child: UISvg(svg: icon, height: 24.h, width: 24.w, color: AppColors.primary),
            ),
          ),
          12.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.boldPrimary(context, fontSize: 16)),
                4.heightBox,
                Text(subtitle, style: AppTextStyles.regularSecondary(context, fontSize: 14)),
              ],
            ),
          ),
          if (time != null)
            Text(time, style: AppTextStyles.regularSecondary(context, fontSize: 12)),
        ],
      ),
    );
  }
}
