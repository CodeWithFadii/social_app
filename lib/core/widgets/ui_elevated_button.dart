import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class UIElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? textColor;
  final EdgeInsets? margin;

  const UIElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textStyle,
    this.textColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 15.w),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 22.sp,
                width: 22.sp,
                child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2.sp),
              )
            : Text(
                text,
                style:
                    textStyle ??
                    AppTextStyles.semiBoldPrimary(
                      context,
                      color: textColor ?? AppColors.white,
                      fontSize: 18,
                    ),
              ),
      ),
    );
  }
}
