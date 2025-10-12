import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:social_app/core/routes/app_routes.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_svg.dart';

class FavouriteProvidersScreen extends StatelessWidget {
  const FavouriteProvidersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  Center(
                    child: UISvg(
                      svg: AppAssets.backButton,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Favourite',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  Center(child: UISvg(svg: AppAssets.listButon)),
                ],
              ),
              30.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'My Favourite',
                  style: AppTextStyles.semiBoldPrimary(context, fontSize: 18),
                ),
              ),
              20.heightBox,

              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Get.toNamed(AppRoutes.orderDetailsScreen);
                      },
                      child: Slidable(
                        endActionPane: ActionPane(
                          extentRatio: .30,
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              onPressed: (value) {
                                Get.toNamed(AppRoutes.invoiceScreen);
                              },
                              backgroundColor: context.theme.primaryColor,
                              foregroundColor: Color(0xff4CBB00),

                              icon: Icons.receipt,
                            ),
                            SlidableAction(
                              onPressed: (value) {},
                              backgroundColor: context.theme.primaryColor,
                              foregroundColor: Colors.red,
                              icon: Icons.delete,
                            ),
                          ],
                        ),

                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                          decoration: BoxDecoration(
                            color: context.theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                color: context.theme.primaryColor.withCustomOpacity(.06),
                                blurRadius: 100,
                                spreadRadius: 0,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Column(
                            spacing: 10.h,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30.h,
                                    backgroundImage: AssetImage(AppAssets.personImage),
                                  ),
                                  10.widthBox,
                                  Column(
                                    spacing: 5.h,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Henry Cavil',
                                        style: AppTextStyles.regularPrimary(
                                          context,
                                          weight: FontWeight.w900,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Row(
                                        spacing: 4.w,
                                        children: [
                                          RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            itemSize: 13,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                Icon(Icons.star, color: Colors.amber),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          Text(
                                            '272(reviews)',
                                            style: AppTextStyles.regularPrimary(
                                              context,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Last Booked ',
                                          style: AppTextStyles.regularPrimary(
                                            context,
                                          ).copyWith(fontSize: 12.sp),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '16 /06 /2025',
                                              style: AppTextStyles.regularPrimary(
                                                context,
                                                fontSize: 11,
                                                weight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    spacing: 6.h,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: context.theme.primaryColor,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          'Plumber',
                                          style: AppTextStyles.regularPrimary(
                                            context,
                                            color: context.theme.scaffoldBackgroundColor,
                                            weight: FontWeight.w600,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        spacing: 4.w,
                                        children: [
                                          UISvg(
                                            svg: AppAssets.marker,
                                            height: 16.h,
                                            color: context.theme.primaryColor,
                                          ),
                                          Text(
                                            'Downtown Street',
                                            style: AppTextStyles.regularPrimary(
                                              context,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8.w,
                                          vertical: 2.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffEDF7FF),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          'Service Provider',
                                          style: AppTextStyles.regularPrimary(
                                            context,
                                            color: Color(0xff0D91F1),
                                            weight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.h),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
