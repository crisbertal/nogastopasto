import 'package:get_it/get_it.dart';
import 'package:no_gasto_pasto/core/view_models/category_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => CategoryModel());
}
