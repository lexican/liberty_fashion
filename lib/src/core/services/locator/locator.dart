import 'package:get_it/get_it.dart';
import 'package:liberty_fashion/src/core/services/analytics_service/analytics_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AnalyticsServiceImpl());
}
