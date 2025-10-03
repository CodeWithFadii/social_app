import 'package:get_it/get_it.dart';
import '../services/network/api_service.dart';
import '../services/secure_storage/secure_storage_service.dart';
import '../theme/theme_controller.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerLazySingleton<ThemeController>(() => ThemeController());

  getIt.registerLazySingleton<ApiService>(() => ApiService());

  getIt.registerLazySingleton<SecureStorageService>(() => SecureStorageService());
}
