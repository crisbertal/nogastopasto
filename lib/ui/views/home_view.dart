import 'package:flutter/material.dart';
import 'package:no_gasto_pasto/ui/views/categories_view.dart';
import 'package:no_gasto_pasto/ui/views/movements_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedItem = 0;

  static List<Widget> _tabs = <Widget>[
    MovementsView(),
    CategoriesView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: _tabs.elementAt(_selectedItem),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch (_selectedItem) {
            case 0:
              Navigator.pushNamed(context, '/add_movement');
              break;
            case 1:
              Navigator.pushNamed(context, '/add_category');
              break;
          }
        },
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
        currentIndex: _selectedItem,
        onTap: _onItemTapped,
      ),
    );
  }
}
