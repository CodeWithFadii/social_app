import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  final Widget? leading;

  const UIElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textStyle,
    this.textColor,
    this.margin,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: margin,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: backgroundColor ?? context.theme.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.symmetric(horizontal: 24.h),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 22.sp,
                width: 22.sp,
                child: CircularProgressIndicator(color: AppColors.white, strokeWidth: 2.sp),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leading != null
                      ? Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: leading)
                      : SizedBox.shrink(),
                  Text(
                    text,
                    style:
                        textStyle ??
                        AppTextStyles.semiBoldPrimary(
                          context,
                          color: textColor ?? context.theme.scaffoldBackgroundColor,
                          fontSize: 15,
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
