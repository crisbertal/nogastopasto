import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/movement.dart';

class DBProvider {
  Future<Database> get database async {
    //if (_database != null) return _database;
    //_database = await initDB();
    //return _database;
    return await initDB();
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();

    final String path = join(documentsDirectory.path, 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        //await db.execute("SQL CON EL CREATE DE LA TABLA");
      },
    );
  }

  Future<int> insertMovement(Movement movement) async {
    final Database db = await database;
    //final int result = await db.rawInsert('SQL CON EL INTERT');
    // VALUES ( ${movement.id}, ${}...)

    // otra forma
    //final int result = await db.insert('Tabla', movement.toJson());

    //return result;
  }
}
