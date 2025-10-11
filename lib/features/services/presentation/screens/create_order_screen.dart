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

import '../../../../core/widgets/ui_textfield.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: UISvg(svg: AppAssets.backButton),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Instant Order',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  Center(child: UISvg(svg: AppAssets.listButon)),
                ],
              ),
              30.heightBox,
              Text('Describe Issue', style: AppTextStyles.semiBoldPrimary(context, fontSize: 15)),
              14.heightBox,

              UITextField(hint: 'Continous Leakage from Kitchen Pipeline', maxLines: 3),
              15.heightBox,
              Text('Upload image', style: AppTextStyles.semiBoldPrimary(context, fontSize: 15)),
              14.heightBox,
              Container(
                height: 130.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  spacing: 12.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UISvg(svg: AppAssets.upload),
                    Text(
                      'Upload Video or Image',
                      style: AppTextStyles.boldPrimary(
                        context,
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              15.heightBox,
              Text('Set Price', style: AppTextStyles.semiBoldPrimary(context, fontSize: 15)),
              14.heightBox,
              PriceSlider(),
              Spacer(),
              UIElevatedButton(text: 'Use Current Location', onPressed: () {}),
              8.heightBox,

              UIElevatedButton(
                text: 'Add Location Manually',
                textColor: AppColors.black,
                backgroundColor: AppColors.secondary,
                onPressed: () {
                  Get.toNamed(AppRoutes.mapViewScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RectangularSliderThumbShape extends SliderComponentShape {
  final double thumbWidth;
  final double thumbHeight;
  final double cornerRadius;

  const RectangularSliderThumbShape({
    required this.thumbWidth,
    required this.thumbHeight,
    this.cornerRadius = 6.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbWidth, thumbHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final Color color = colorTween.evaluate(enableAnimation)!;

    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: thumbWidth, height: thumbHeight),
      Radius.circular(cornerRadius),
    );

    canvas.drawRRect(rrect, Paint()..color = color);
  }
}

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  double value = 40; // initial value

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: context.theme.primaryColor,
        inactiveTrackColor: context.theme.textTheme.labelSmall!.color,
        thumbColor: context.theme.primaryColor,
        overlayColor: Colors.transparent,
        padding: EdgeInsets.zero,
        trackHeight: 4.0,
        thumbShape: const RectangularSliderThumbShape(
          thumbWidth: 12.0,
          thumbHeight: 24.0,
          cornerRadius: 6.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            value: value,
            min: 0,
            max: 120,
            onChanged: (newValue) {
              setState(() {
                value = newValue;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$0', style: TextStyle(color: Colors.grey.shade600)),
              Text('\$120', style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ],
      ),
    );
  }
}
