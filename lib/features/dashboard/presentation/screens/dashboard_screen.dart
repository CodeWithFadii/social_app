import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';
import 'package:social_app/features/home/presentation/screens/home_screen.dart';

import '../../../activity/presentation/screens/activity_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../services/presentation/screens/services_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<_NavItem> _navItems = [
    _NavItem('Home', AppAssets.home),
    _NavItem('Services', AppAssets.services),
    _NavItem('Activity', AppAssets.activity),
    _NavItem('Profile', AppAssets.profile),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [HomeScreen(), ServicesScreen(), ActivityScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: context.theme.primaryColor.withCustomOpacity(.15),
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_navItems.length, (index) {
              final isSelected = _selectedIndex == index;
              final item = _navItems[index];
              final color = isSelected
                  ? context.theme.primaryColor
                  : context.theme.textTheme.labelSmall!.color;

              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UISvg(svg: item.icon, height: 20.h, color: color),
                    8.heightBox,
                    Text(
                      item.label,
                      style: AppTextStyles.semiBoldPrimary(
                        context,
                        fontSize: 13,
                      ).copyWith(color: color),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String icon;
  _NavItem(this.label, this.icon);
}
