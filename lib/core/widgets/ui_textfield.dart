import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class UITextField extends StatelessWidget {
  const UITextField({
    super.key,
    this.height,
    this.icon,
    this.hint,
    this.controller,
    this.inputType,
    this.maxLength,
    this.maxLines,
    this.obscure,
    this.leading,
    this.trailing,
    this.margin,
    this.contentPadding,
    this.textAlign,
    this.verticalAlign,
    this.textStyle,
    this.cursorColor,
    this.focusNode,
    this.onChanged,
    this.enabled,
    this.expandable,
    this.onTap,
    this.autoFocus,
    this.onTapOutside,
  });

  final double? height;
  final String? icon;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLength;
  final int? maxLines;
  final bool? obscure;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final Alignment? verticalAlign;
  final TextStyle? textStyle;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final bool? enabled;
  final bool? expandable;
  final bool? autoFocus;
  final Function()? onTap;
  final Function(PointerDownEvent)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: verticalAlign,
      // height: maxLines == null ? null : height ?? 52.h,
      height: height ?? 52.h,
      margin: margin,
      padding: EdgeInsets.only(left: icon != null ? 14.w : 8.w, right: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: BoxBorder.all(color: Color(0xffDADADA)),
      ),
      child: Row(
        children: [
          icon != null ? SvgPicture.asset(icon!) : leading ?? const SizedBox(),
          SizedBox(width: icon != null ? 18.w : 0),
          Expanded(
            child: TextField(
              onTap: onTap,
              onTapOutside: onTapOutside,
              controller: controller,
              focusNode: focusNode,
              autofocus: autoFocus ?? false,
              enabled: enabled,
              keyboardType: inputType ?? TextInputType.text,
              onChanged: onChanged,
              obscureText: obscure ?? false,
              onTapUpOutside: (value) {
                FocusScope.of(context).unfocus();
              },
              cursorHeight: 22.h,

              cursorColor: cursorColor ?? context.theme.textTheme.bodyLarge!.color,
              style:
                  textStyle ?? AppTextStyles.mediumPrimary(context, fontSize: 16, letterSpacing: 0),
              maxLength: maxLength,
              maxLines: expandable == true ? null : 1,
              textAlign: textAlign ?? TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                fillColor: context.theme.scaffoldBackgroundColor,
                hintText: hint,
                hintStyle: AppTextStyles.regularSecondary(
                  context,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: contentPadding,
                counterText: '',
              ),
            ),
          ),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
