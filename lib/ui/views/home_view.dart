import 'package:flutter/material.dart';
import 'package:no_gasto_pasto/ui/views/categories_view.dart';
import 'package:no_gasto_pasto/ui/views/movements_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _itemSeleccionado = 0;

  static List<Widget> _pestanas = <Widget>[
    MovementsView(),
    CategoriesView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _itemSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movimientos'),
      ),
      body: _pestanas.elementAt(_itemSeleccionado),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Movimientos'),
            icon: Icon(Icons.euro_symbol),
          ),
          BottomNavigationBarItem(
            title: Text('Categorias'),
            icon: Icon(Icons.list),
          ),
        ],
        currentIndex: _itemSeleccionado,
        onTap: _onItemTapped,
      ),
    );
  }
}
