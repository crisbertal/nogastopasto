import 'package:no_gasto_pasto/core/models/category.dart';
import 'package:no_gasto_pasto/core/models/movement.dart';

import 'api.dart';

class MockApi implements Api {
  @override
  Future<void> addCategory(Category category) {
    // TODO: implement addCategory
    return null;
  }

  @override
  Future<void> addMovement(Movement movement) {
    // TODO: implement addMovement
    return null;
  }

  @override
  Future<List<Category>> getCategories() {
    // TODO: implement getCategories
    return null;
  }

  @override
  Future<List<Movement>> getMovements() {
    // TODO: implement getMovements
    return null;
  }
}
