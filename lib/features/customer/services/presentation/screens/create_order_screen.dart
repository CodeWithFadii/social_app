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

import '../../../../../core/widgets/ui_textfield.dart';

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
  double value = 40.0; // initial value
  final double minValue = 0.0;
  final double maxValue = 120.0;

  // Thumb size should match the thumbShape values below
  final double thumbW = 12.0;
  final double thumbH = 24.0;

  @override
  Widget build(BuildContext context) {
    // We'll place the min/max labels outside the Stack so they remain unaffected.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Container to limit width if needed from parent; LayoutBuilder gives us size.
        LayoutBuilder(
          builder: (context, constraints) {
            final double totalWidth = constraints.maxWidth;
            // We add horizontal padding to Slider equal to half thumb width so the thumb center can reach both edges visually.
            final double horizontalHandlePadding = thumbW / 2;

            // trackWidth is the visual space the thumb center travels across:
            final double trackWidth = totalWidth - (horizontalHandlePadding * 2);

            // Normalized fraction of the slider
            final double frac = (value - minValue) / (maxValue - minValue);

            // x position for the label: position anchored to the thumb center.
            final double labelLeft = horizontalHandlePadding + (frac * trackWidth) - (thumbW / 2);

            return SizedBox(
              height: 80, // enough to show tooltip + slider
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // The Slider (with padding so track endpoints align visually)
                  Positioned.fill(
                    top: 28,
                    bottom: 0,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Theme.of(context).primaryColor,
                        inactiveTrackColor: Theme.of(context).textTheme.labelSmall?.color,
                        thumbColor: Theme.of(context).primaryColor,
                        overlayColor: Colors.transparent,
                        trackHeight: 4.0,
                        thumbShape: RectangularSliderThumbShape(
                          thumbWidth: thumbW,
                          thumbHeight: thumbH,
                          cornerRadius: 6.0,
                        ),
                        // Provide horizontal padding so thumb center range equals [0..totalWidth]
                        rangeThumbShape: const RoundRangeSliderThumbShape(), // not used but safe
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: horizontalHandlePadding),
                        child: Slider(
                          padding: EdgeInsets.zero,
                          value: value,
                          min: minValue,
                          max: maxValue,
                          onChanged: (newValue) {
                            setState(() => value = newValue);
                          },
                        ),
                      ),
                    ),
                  ),

                  // Price label above the thumb (clamped so it doesn't overflow widget)
                  Positioned(
                    left: labelLeft.clamp(
                      0.0,
                      totalWidth - 80.0,
                    ), // 80 is approx label width; clamps prevent overflow
                    top: 0,
                    child: Material(
                      // use Material so text has proper elevation & shape without needing extra widgets
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        decoration: BoxDecoration(
                          color: context.theme.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '\$${value.toStringAsFixed(0)}',
                          style: TextStyle(
                            color: context.theme.scaffoldBackgroundColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // Spacing then min & max labels in a Row (keeps them at the sides)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${minValue.toStringAsFixed(0)}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Text(
                '\$${maxValue.toStringAsFixed(0)}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
