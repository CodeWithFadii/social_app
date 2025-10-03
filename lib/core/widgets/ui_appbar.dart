import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

import '../theme/app_text_styles.dart';
import '../utils/app_assets.dart';

class UIAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  const UIAppbar({Key? key, required this.title, this.onBack, this.actions}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40.w,
      centerTitle: false,
      scrolledUnderElevation: 0,
      leading: GestureDetector(
        onTap: onBack ?? () => Get.back(),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: UISvg(
            svg: AppAssets.arrowBackIcon,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: Text(title, style: AppTextStyles.semiBoldPrimary(context, fontSize: 24)),
      ),
      actions: actions,
    );
  }
}
