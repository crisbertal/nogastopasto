import 'package:flutter/material.dart';
import 'package:no_gasto_pasto/locator.dart';
import 'package:no_gasto_pasto/ui/views/add_category_view.dart';
import 'package:no_gasto_pasto/ui/views/add_movement_view.dart';
import 'package:no_gasto_pasto/ui/views/home_view.dart';

void main() {
  setupLocator();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Gasto Pasto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => HomeView(),
        '/add_movement': (_) => AddMovementView(),
        '/add_category': (_) => AddCategoryView(),
      },
      initialRoute: '/',
    );
  }
}
