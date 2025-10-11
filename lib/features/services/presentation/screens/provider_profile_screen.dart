import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class ProviderProfileScreen extends StatefulWidget {
  const ProviderProfileScreen({super.key});

  @override
  State<ProviderProfileScreen> createState() => _ProviderProfileScreenState();
}

class _ProviderProfileScreenState extends State<ProviderProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
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
                    child: UISvg(svg: AppAssets.backButton, onTap: () => Get.back()),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Profile Screen',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  UISvg(svg: AppAssets.notifications, onTap: () {}, height: 38.h),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    20.heightBox,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40.h,
                          backgroundImage: AssetImage(AppAssets.personImage),
                        ),
                        16.widthBox,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Lucy Miller',
                                    style: AppTextStyles.boldPrimary(context, fontSize: 20),
                                  ),
                                  Spacer(),
                                  Row(
                                    spacing: 8.w,
                                    children: [
                                      UISvg(
                                        svg: AppAssets.caseIcon,
                                        height: 24.h,
                                        width: 24.w,
                                        onTap: () {},
                                        color: context.theme.primaryColor,
                                      ),
                                      12.heightBox,
                                      UISvg(
                                        svg: AppAssets.list,
                                        height: 20.h,
                                        width: 20.w,
                                        onTap: () {},
                                        color: context.theme.primaryColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              8.heightBox,
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  '@Lucy3447',
                                  style: AppTextStyles.regularPrimary(
                                    context,
                                    fontSize: 12,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              12.heightBox,
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: AppTextStyles.regularSecondary(context, fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    30.heightBox,
                    Row(
                      children: [
                        Expanded(child: _buildStatCard('100+', 'Jobs Done')),
                        12.widthBox,
                        Expanded(child: _buildStatCard('5.0', 'Ratings', showStar: true)),
                        12.widthBox,
                        Expanded(child: _buildStatCard('', 'Dubai, UAE', showFlag: true)),
                      ],
                    ),
                    20.heightBox,
                    UIElevatedButton(text: 'Fast Order now', onPressed: () {}),
                    10.heightBox,
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: AppColors.primary,
                        indicatorWeight: 3,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: context.theme.primaryColor,
                        unselectedLabelColor: AppColors.textSecondary,
                        labelStyle: AppTextStyles.mediumPrimary(context, fontSize: 14),
                        unselectedLabelStyle: AppTextStyles.regularPrimary(context, fontSize: 14),
                        tabs: [
                          Tab(text: 'Posts & Videos'),
                          Tab(text: 'Recent'),
                        ],
                      ),
                    ),
                    20.heightBox,
                    SizedBox(
                      height: 400.h,
                      child: TabBarView(
                        controller: _tabController,
                        children: [_buildPostsGrid(), _buildRecentGrid()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String value,
    String label, {
    bool showStar = false,
    bool showFlag = false,
  }) {
    return Container(
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
      child: Column(
        children: [
          if (showStar) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UISvg(
                  svg: AppAssets.star,
                  height: 16.h,
                  width: 16.w,
                  color: context.theme.primaryColor,
                ),
                4.widthBox,
                Text(value, style: AppTextStyles.boldPrimary(context, fontSize: 18)),
              ],
            ),
          ] else if (showFlag) ...[
            UISvg(svg: AppAssets.dubai, height: 28.h, width: 28.w),
          ] else ...[
            Text(value, style: AppTextStyles.boldPrimary(context, fontSize: 18)),
          ],
          8.heightBox,
          Text(
            label,
            style: AppTextStyles.regularSecondary(context, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 1,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        bool isVideo = index % 3 == 1 || index % 3 == 2;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            image: DecorationImage(image: AssetImage(AppAssets.personImage), fit: BoxFit.cover),
          ),
          child: isVideo ? Center(child: UISvg(svg: AppAssets.play)) : null,
        );
      },
    );
  }

  Widget _buildRecentGrid() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 1,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            image: DecorationImage(image: AssetImage(AppAssets.personImage), fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
