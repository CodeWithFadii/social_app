import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';
import 'package:social_app/core/widgets/ui_textfield.dart';

import '../../../services/presentation/screens/order_details_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Center(
                    child: UISvg(
                      svg: AppAssets.backButton,
                      onTap: () => Get.back(),
                    ),
                  ),
                  12.widthBox,
                  CircleAvatar(
                    radius: 20.h,
                    backgroundImage: AssetImage(AppAssets.personImage),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Benjamin',
                          style: AppTextStyles.boldPrimary(
                            context,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Active now',
                          style: AppTextStyles.regularSecondary(
                            context,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  UISvg(
                    svg: AppAssets.call,
                    height: 24.h,
                    width: 24.w,
                    onTap: () {},
                  ),
                  16.widthBox,
                  UISvg(
                    svg: AppAssets.list,
                    height: 20.h,
                    width: 20.w,
                    onTap: () {},
                    color: context.theme.primaryColor,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withCustomOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TimeDisplay(),
            ),
            20.heightBox,
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.textSecondary.withCustomOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Today',
                          style: AppTextStyles.regularSecondary(
                            context,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    20.heightBox,
                    Expanded(
                      child: ListView(
                        children: [
                          _buildOutgoingMessage(
                            'Hello! Jhon abraham',
                            '09:25 AM',
                          ),
                          18.heightBox,
                          _buildIncomingMessage(
                            'Benjamin Hello ! Mario How are you?',
                            '09:25 AM',
                          ),
                          18.heightBox,
                          _buildOutgoingMessage(
                            'Doing Well! What you think about work',
                            '09:25 AM',
                          ),
                          18.heightBox,
                          _buildIncomingMessage(
                            'Benjamin Have a great working week!!',
                            '09:25 AM',
                          ),
                          18.heightBox,
                          _buildIncomingMessage(
                            'You did your job Well!',
                            '09:25 AM',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  UISvg(
                    svg: AppAssets.attachment,
                    height: 24.h,
                    width: 24.w,
                    onTap: () {},
                    color: context.theme.primaryColor,
                  ),
                  12.widthBox,
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.scaffoldBackgroundColor,
                      ),
                      child: UITextField(
                        controller: _messageController,
                        hint: 'Write your message',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            UISvg(
                              svg: AppAssets.sticker,
                              height: 24.h,
                              width: 24.w,
                              onTap: () {},
                              color: context.theme.primaryColor,
                            ),
                            8.widthBox,
                          ],
                        ),
                      ),
                    ),
                  ),
                  12.widthBox,
                  UISvg(
                    svg: AppAssets.camera,
                    height: 20.h,
                    width: 20.w,
                    onTap: () {},
                    color: context.theme.primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutgoingMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: AppTextStyles.regularSecondary(context, fontSize: 11),
          ),
          8.widthBox,
          Container(
            constraints: BoxConstraints(maxWidth: 250.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
            ),
            child: Text(
              message,
              style: AppTextStyles.regularPrimary(
                context,
                fontSize: 14,
                color: context.theme.scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomingMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 250.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Text(
              message,
              style: AppTextStyles.regularPrimary(
                context,
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
          ),
          8.widthBox,
          Text(
            time,
            style: AppTextStyles.regularSecondary(context, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
