import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_app/core/theme/app_colors.dart';
import 'package:social_app/core/theme/app_text_styles.dart';
import 'package:social_app/core/utils/app_assets.dart';
import 'package:social_app/core/utils/extentions.dart';
import 'package:social_app/core/widgets/ui_elevated_button.dart';
import 'package:social_app/core/widgets/ui_svg.dart';
import 'package:social_app/core/widgets/ui_textfield.dart';

class RateServiceScreen extends StatefulWidget {
  const RateServiceScreen({super.key});

  @override
  State<RateServiceScreen> createState() => _RateServiceScreenState();
}

class _RateServiceScreenState extends State<RateServiceScreen> {
  // Rating questions state
  String? question1Answer;
  String? question2Answer;
  String? question3Answer;
  String? question4Answer;

  // Star rating state
  int starRating = 0;

  // Feedback text controller
  final TextEditingController _feedbackController = TextEditingController();

  final List<String> _ratingOptions = ['Good', 'Poor', 'Excellent'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  UISvg(onTap: () => Get.back(), svg: AppAssets.backButton),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Rating',
                        style: AppTextStyles.boldPrimary(context, fontSize: 18),
                      ),
                    ),
                  ),
                  Center(child: UISvg(svg: AppAssets.listButon)),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.heightBox,

                    // Main Question
                    Text(
                      'Q. How was your Experience by Ordering our Services ?',
                      style: AppTextStyles.boldPrimary(context, fontSize: 20),
                    ),
                    14.heightBox,
                    Text(
                      'Give Your Answers',
                      style: AppTextStyles.regularSecondary(context, fontSize: 14),
                    ),
                    40.heightBox,

                    // Rating Questions
                    _buildRatingQuestion(
                      '1. Describe your Experience ?',
                      question1Answer,
                      (value) => setState(() => question1Answer = value),
                    ),
                    20.heightBox,

                    _buildRatingQuestion(
                      '2. How was the Work ?',
                      question2Answer,
                      (value) => setState(() => question2Answer = value),
                    ),
                    20.heightBox,

                    _buildRatingQuestion(
                      '3. Provider Behaviour ?',
                      question3Answer,
                      (value) => setState(() => question3Answer = value),
                    ),
                    20.heightBox,

                    _buildRatingQuestion(
                      '4. Reach on Time ?',
                      question4Answer,
                      (value) => setState(() => question4Answer = value),
                    ),
                    40.heightBox,

                    // Company Rating Section
                    Text('Rate Company', style: AppTextStyles.boldPrimary(context, fontSize: 18)),
                    20.heightBox,

                    // Star Rating
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () => setState(() => starRating = index + 1),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Icon(
                                index < starRating ? Icons.star : Icons.star_border,
                                size: 40.sp,
                                color: AppColors.grey,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    40.heightBox,

                    // Written Feedback Section
                    Text(
                      'Give Written Feedback',
                      style: AppTextStyles.boldPrimary(context, fontSize: 18),
                    ),
                    20.heightBox,

                    // Feedback Text Field
                    UITextField(hint: 'Right Feedback here', maxLines: 4),
                    40.heightBox,
                  ],
                ),
              ),
            ),

            // Submit Button
            Padding(
              padding: EdgeInsets.all(16.w),
              child: UIElevatedButton(text: 'Submit', onPressed: _handleSubmit),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingQuestion(String question, String? selectedValue, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: AppTextStyles.mediumPrimary(context, fontSize: 16)),
        12.heightBox,
        Row(
          children: _ratingOptions.map((option) {
            bool isSelected = selectedValue == option;
            return Expanded(
              child: GestureDetector(
                onTap: () => onChanged(option),
                child: Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? context.theme.primaryColor : Colors.transparent,
                        border: Border.all(
                          color: isSelected ? context.theme.primaryColor : AppColors.grey,
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.circle,
                              size: 10.sp,
                              color: context.theme.scaffoldBackgroundColor,
                            )
                          : null,
                    ),
                    8.widthBox,
                    Text(option, style: AppTextStyles.regularPrimary(context, fontSize: 14)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _handleSubmit() {
    // Handle submit logic here
    Get.back();
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
