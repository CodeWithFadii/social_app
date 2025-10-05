import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:social_app/features/auth/presentation/screens/welcome_screen.dart';
import '../../features/auth/bindings/auth_bindings.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/splash/presentation/screen/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.initial, page: () => SplashScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen(), binding: AuthBindings()),
    GetPage(name: AppRoutes.welcomeScreen, page: () => WelcomeScreen(), binding: AuthBindings()),
  ];
}
