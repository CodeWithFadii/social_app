import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.heightBox,

              Text('Services', style: AppTextStyles.semiBoldPrimary(context, fontSize: 23)),
              30.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'What we Offer',
                    style: AppTextStyles.regularPrimary(
                      context,
                      weight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'See All',
                    style: AppTextStyles.regularPrimary(
                      context,
                      color: Color(0xff28B915),
                      weight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              15.heightBox,
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final data = [
                      ['Electrician Services', AppAssets.electrition, AppAssets.electritionBg],
                      ['Plumbing Services', AppAssets.plumbing, AppAssets.plumbingBg],
                      ['Carpenter Services', AppAssets.carpenter, AppAssets.carpenterBg],
                      ['Ac Repairing Services', AppAssets.acRepair, AppAssets.acBg],
                    ];
                    final item = data[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.createOrderScreen);
                      },
                      child: Container(
                        height: 110.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withCustomOpacity(0.53),
                              BlendMode.darken,
                            ),
                            image: AssetImage(item[2].toString()),
                          ),
                        ),
                        child: Column(
                          spacing: 8.h,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UISvg(svg: item[1].toString(), height: 36.h),
                            Text(
                              item[0].toString(),
                              style: AppTextStyles.semiBoldPrimary(
                                context,
                                fontSize: 18,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.h),
                ),
              ),
              UIElevatedButton(text: 'Load More', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
