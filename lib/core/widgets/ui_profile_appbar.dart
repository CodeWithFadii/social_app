import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/app_assets.dart';

class UIProfileAppbar extends StatelessWidget implements PreferredSizeWidget {
  const UIProfileAppbar({
    super.key,
    required this.userName,
    this.avatarUrl,
    this.avatarRadius = 18,
    required this.onActionTap,
  });

  final String userName;
  final String? avatarUrl;
  final double avatarRadius;
  final VoidCallback onActionTap;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      scrolledUnderElevation: 0,
      titleSpacing: 18.w,

      title: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40.sp,
              width: 40.sp,
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textFieldBackground,
                border: Border.all(color: AppColors.primary),
                image: avatarUrl != null && avatarUrl!.isNotEmpty
                    ? DecorationImage(image: NetworkImage(avatarUrl!))
                    : null,
              ),
              child: UISvg(svg: AppAssets.userAltIcon, color: AppColors.primary),
            ),
          ),

          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.mediumPrimary(context, fontSize: 19),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: InkWell(
            onTap: onActionTap,
            borderRadius: BorderRadius.circular(24.r),
            child: SizedBox(
              height: 40.w,
              width: 40.w,
              child: Center(child: UISvg(svg: AppAssets.drawerIcon)),
            ),
          ),
        ),
      ],
    );
  }
}
