import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:social_app/features/auth/presentation/screens/new_password_screen.dart';
import 'package:social_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:social_app/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:social_app/features/auth/presentation/screens/welcome_screen.dart';
import '../../features/auth/bindings/auth_bindings.dart';
import '../../features/auth/presentation/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/screens/personal_info_screen.dart';
import '../../features/auth/presentation/screens/privacy_policy_screen.dart';
import '../../features/auth/presentation/screens/sign_in_screen.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';
import '../../features/auth/presentation/screens/wallet_screen.dart';
import '../../features/auth/presentation/screens/add_card_screen.dart';
import '../../features/auth/presentation/screens/enable_location_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.initial, page: () => SplashScreen()),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => SignInScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => WelcomeScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.verifyEmailScreen,
      page: () => VerifyEmailScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.newPasswordScreen,
      page: () => NewPasswordScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.personalInfoScreen,
      page: () => PersonalInfoScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.walletScreen,
      page: () => WalletScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.addCardScreen,
      page: () => AddCardScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: AppRoutes.enableLocationScreen,
      page: () => EnableLocationScreen(),
      binding: AuthBindings(),
    ),
  ];
}
