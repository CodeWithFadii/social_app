import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
    final isMultiLine = (maxLines != null && maxLines! > 1) || (expandable == true);

    return Container(
      alignment: verticalAlign,
      height: isMultiLine ? null : height ?? 52.h, // Allow auto expansion for multi-line
      margin: margin,
      padding: EdgeInsets.only(left: icon != null ? 14.w : 4.w, right: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xffDADADA)),
      ),
      child: Row(
        crossAxisAlignment: isMultiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (icon != null) SvgPicture.asset(icon!) else leading ?? const SizedBox(),
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
              cursorHeight: 22.h,
              cursorColor: cursorColor ?? context.theme.textTheme.bodyLarge!.color,
              style:
                  textStyle ?? AppTextStyles.mediumPrimary(context, fontSize: 16, letterSpacing: 0),
              maxLength: maxLength,
              maxLines: expandable == true ? null : maxLines ?? 1,
              minLines: expandable == true ? 1 : null,
              textAlign: textAlign ?? TextAlign.start,
              decoration: InputDecoration(
                filled: true,
                fillColor: context.theme.scaffoldBackgroundColor,
                hintText: hint,
                hintStyle: AppTextStyles.regularSecondary(
                  context,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding:
                    contentPadding ??
                    EdgeInsets.symmetric(vertical: isMultiLine ? 10.h : 0, horizontal: 4.w),
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
