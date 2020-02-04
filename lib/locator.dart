import 'package:get_it/get_it.dart';
import 'package:no_gasto_pasto/core/services/api/mock_api.dart';
import 'package:no_gasto_pasto/core/services/api/sqlite_api.dart';
import 'package:no_gasto_pasto/core/view_models/category_model.dart';

GetIt locator = GetIt.instance;

const bool USE_FAKE_IMPLEMENTATION = true;

void setupLocator() {
  locator.registerLazySingleton(
      () => USE_FAKE_IMPLEMENTATION ? MockApi() : SqliteApi());
  locator.registerFactory(() => CategoryModel());
}
