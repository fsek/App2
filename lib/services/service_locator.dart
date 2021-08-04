import 'package:fsek_mobile/services/event.service.dart';
import 'package:get_it/get_it.dart';
import 'package:fsek_mobile/services/home.service.dart';
import 'package:fsek_mobile/services/notifications.service.dart';
import 'package:fsek_mobile/services/theme.service.dart';
import 'package:fsek_mobile/services/user.service.dart';
import 'package:fsek_mobile/util/storage_wrapper.dart';

import 'navigation.service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => TokenStorageWrapper());
  locator.registerLazySingleton(
      () => UserService(storage: locator<TokenStorageWrapper>()));
  locator.registerLazySingleton(() => HomeService());
  locator.registerLazySingleton(() => NotificationsService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => EventService());
}
