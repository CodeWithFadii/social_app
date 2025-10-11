import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initiateRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(AppRoutes.welcomeScreen);
  }

  @override
  void initState() {
    super.initState();
    initiateRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Logo',
          style: AppTextStyles.regularPrimary(
            context,
          ).copyWith(fontFamily: GoogleFonts.pacifico().fontFamily, fontSize: 65),
        ),
      ),
    );
  }
}
