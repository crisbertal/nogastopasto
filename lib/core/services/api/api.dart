import 'package:no_gasto_pasto/core/models/category.dart';
import 'package:no_gasto_pasto/core/models/movement.dart';

abstract class Api {
  Future<List<Movement>> getMovements();

  Future<void> addMovement(Movement movement);

  Future<List<Category>> getCategories();

  Future<void> addCategory(Category category);
}
