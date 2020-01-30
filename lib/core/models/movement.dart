import 'package:intl/intl.dart';

class Movement {
  final int id;
  final int categoryId;
  final String title;
  final double quantity;
  final DateTime date;

  Movement({
    this.id,
    this.categoryId,
    this.title,
    this.quantity,
    this.date,
  });

  String getFechaFormateada() {
    return DateFormat.yMd().format(this.date);
  }
}
