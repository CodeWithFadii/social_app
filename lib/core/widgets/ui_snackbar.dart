import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class UISnackbar {
  static void show({
    required String title,
    required String message,
    SnackPosition position = SnackPosition.TOP,
    Duration duration = const Duration(seconds: 5),
    bool isSuccess = false,
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
      snackPosition: position,
      shouldIconPulse: true,
      icon: isSuccess ? null : Icon(Icons.error, color: AppColors.white),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      borderRadius: 10.r,
      backgroundColor: isSuccess
          ? AppColors.primary.withAlpha(230)
          : AppColors.error.withAlpha(230),
      colorText: AppColors.white,
      duration: duration,
      titleText: Text(
        title,
        style: AppTextStyles.boldPrimary(Get.context!, color: AppColors.white, fontSize: 17),
      ),
      messageText: Text(
        message,
        style: AppTextStyles.regularPrimary(Get.context!, color: AppColors.white, fontSize: 15),
      ),
    );
  }
}
