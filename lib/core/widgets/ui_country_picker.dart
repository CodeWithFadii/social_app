
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_text_styles.dart';

class UICountryPicker extends StatelessWidget {
  const UICountryPicker({
    super.key,
    this.initialCountryCode = '+971',
    this.showFlagMain = true,
    this.showCode = true,
    this.onInit,
    this.onChanged,
  });

  final String initialCountryCode;
  final bool showFlagMain;
  final bool showCode;
  final ValueChanged<CountryCode?>? onInit;
  final Function(CountryCode)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      initialSelection: initialCountryCode,
      padding: EdgeInsets.zero,
      showCountryOnly: showCode,
      pickerStyle: PickerStyle.bottomSheet,
      showFlag: true,
      showFlagMain: showFlagMain, 
      textStyle: AppTextStyles.mediumPrimary(context, fontSize: 16),
      searchStyle: AppTextStyles.mediumPrimary(context, fontSize: 16),
      dialogTextStyle: AppTextStyles.mediumPrimary(context, fontSize: 16),

      searchDecoration: InputDecoration(
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
        hint: Text('Search your Country'),
      ),
      boxDecoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      onInit: onInit,
      onChanged: onChanged,
    );
  }
}
