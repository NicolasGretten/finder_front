import 'package:freshbuyer/utils/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'navigation_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerSingleton<AuthService>(AuthService());
}
