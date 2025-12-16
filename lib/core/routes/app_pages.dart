import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:social_app/features/customer/auth/presentation/screens/new_password_screen.dart';
import 'package:social_app/features/customer/auth/presentation/screens/verify_email_screen.dart';
import 'package:social_app/features/customer/auth/presentation/screens/welcome_screen.dart';
import 'package:social_app/features/customer/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/customer/auth/bindings/auth_bindings.dart';
import '../../features/customer/auth/presentation/screens/add_card_screen.dart';
import '../../features/customer/auth/presentation/screens/enable_location_screen.dart';
import '../../features/customer/auth/presentation/screens/otp_verification_screen.dart';
import '../../features/customer/auth/presentation/screens/personal_info_screen.dart';
import '../../features/customer/auth/presentation/screens/privacy_policy_screen.dart';
import '../../features/customer/auth/presentation/screens/sign_in_screen.dart';
import '../../features/customer/auth/presentation/screens/sign_up_screen.dart';
import '../../features/customer/chat/presentation/screens/chat_screen.dart';
import '../../features/customer/profile/presentation/screens/change_password_screen.dart';
import '../../features/customer/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/customer/profile/presentation/screens/favourite_providers_screen.dart';
import '../../features/customer/profile/presentation/screens/help_center_screen.dart';
import '../../features/customer/profile/presentation/screens/invoice_screen.dart';
import '../../features/customer/profile/presentation/screens/notification_screen.dart';
import '../../features/customer/profile/presentation/screens/rate_screen.dart';
import '../../features/customer/profile/presentation/screens/rate_service_screen.dart';
import '../../features/customer/screen/splash_screen.dart';
import '../../features/customer/services/presentation/screens/create_order_screen.dart';
import '../../features/customer/services/presentation/screens/map_view_screen.dart';
import '../../features/customer/services/presentation/screens/order_details_screen.dart';
import '../../features/customer/services/presentation/screens/provider_profile_screen.dart';
import '../../features/customer/auth/presentation/screens/wallet_screen.dart';
import '../../features/provider/auth/presentation/screens/provider_login_screen.dart';
import '../../features/provider/dashboard/presentation/screens/dashboard_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.initial, page: () => SplashScreen()),
    GetPage(name: AppRoutes.signInScreen, page: () => SignInScreen(), binding: AuthBindings()),
    GetPage(name: AppRoutes.welcomeScreen, page: () => WelcomeScreen(), binding: AuthBindings()),
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      binding: AuthBindings(),
    ),
    GetPage(name: AppRoutes.signUpScreen, page: () => SignUpScreen(), binding: AuthBindings()),
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
    GetPage(name: AppRoutes.walletScreen, page: () => WalletScreen(), binding: AuthBindings()),
    GetPage(name: AppRoutes.addCardScreen, page: () => AddCardScreen(), binding: AuthBindings()),
    GetPage(
      name: AppRoutes.enableLocationScreen,
      page: () => EnableLocationScreen(),
      binding: AuthBindings(),
    ),
    GetPage(name: AppRoutes.dashboardScreen, page: () => DashboardScreen()),
    GetPage(name: AppRoutes.createOrderScreen, page: () => CreateOrderScreen()),
    GetPage(name: AppRoutes.mapViewScreen, page: () => MapViewScreen()),
    GetPage(name: AppRoutes.orderDetailsScreen, page: () => OrderDetailsScreen()),
    GetPage(name: AppRoutes.chatScreen, page: () => ChatScreen()),
    GetPage(name: AppRoutes.editProfileScreen, page: () => EditProfileScreen()),
    GetPage(name: AppRoutes.providerProfileScreen, page: () => ProviderProfileScreen()),
    GetPage(name: AppRoutes.helpCenterScreen, page: () => HelpCenterScreen()),
    GetPage(name: AppRoutes.notificationScreen, page: () => NotificationScreen()),
    GetPage(name: AppRoutes.favouriteProvidersScreen, page: () => FavouriteProvidersScreen()),
    GetPage(name: AppRoutes.rateScreen, page: () => RateScreen()),
    GetPage(name: AppRoutes.invoiceScreen, page: () => InvoiceScreen()),
    GetPage(name: AppRoutes.rateServiceScreen, page: () => RateServiceScreen()),
    GetPage(name: AppRoutes.providerLoginScreen, page: () => ProviderLoginScreen()),
    GetPage(name: AppRoutes.changePasswordScreen, page: () => ChangePasswordScreen()),
    GetPage(name: AppRoutes.providerDashboardScreen, page: () => ProviderDashboardScreen()),
  ];
}
