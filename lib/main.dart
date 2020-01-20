import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() => runApp(
      ChangeNotifierProvider<DataProvider>(
        create: (_) => DataProvider(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Gasto Pasto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItem = 0;

  static List<Widget> _items = <Widget>[
    MovementsPage(),
    CategoriesPage(),
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
        title: Text('Movimientos'),
      ),
      body: _items.elementAt(_selectedItem),
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
        currentIndex: _selectedItem,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MovementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Has to rebuild in every change
    DataProvider data = Provider.of<DataProvider>(context, listen: true);

    return ListView.separated(
      itemCount: data.movementList.length,
      itemBuilder: (_, index) {
        if (data.movementList.length == 0)
          return Center(
            child: Text('No hay movimientos'),
          );
        else
          return ListTile(
            title: Text(data.movementList.elementAt(index).title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Cantidad gastada / Maximo'),
                Text(data
                    .getCategoryById(
                        data.movementList.elementAt(index).categoryId)
                    .name),
              ],
            ),
            trailing: Text(
                'Cantidad: ${data.movementList.elementAt(index).quantity}'),
            leading:
                Text('${data.movementList.elementAt(index).getFormatedDate()}'),
          );
      },
      separatorBuilder: (_, index) => Divider(),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataProvider data = Provider.of<DataProvider>(context, listen: true);

    return ListView.separated(
      itemCount: data.categoryList.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(data.categoryList.elementAt(index).name),
        trailing: Text(
            'Maximo: ' + data.categoryList.elementAt(index).max.toString()),
      ),
      separatorBuilder: (_, __) => Divider(),
    );
  }
}

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

  String getFormatedDate() {
    return DateFormat.yMd().format(this.date);
  }
}

class Category {
  final int id;
  final String name;
  final double max;

  Category({
    this.id,
    this.name,
    this.max,
  });
}

class DataProvider extends ChangeNotifier {
  List<Category> categoryList = [
    Category(id: 0, name: 'Mercadona', max: 100.0),
    Category(id: 1, name: 'Fiesta', max: 60.0),
    Category(id: 2, name: 'Comer fuera', max: 30.0),
    Category(id: 3, name: 'Capricho', max: 20.0),
  ];

  List<Movement> movementList = [
    Movement(
      id: 0,
      categoryId: 0,
      title: 'Compra mercadona',
      quantity: 20.0,
      date: DateTime(2020, 1, 10),
    ),
    Movement(
      id: 1,
      categoryId: 0,
      title: 'Compra mercadona',
      quantity: 23.0,
      date: DateTime(2020, 1, 11),
    ),
    Movement(
      id: 2,
      categoryId: 1,
      title: 'Cerveza Vintage',
      quantity: 3.0,
      date: DateTime(2020, 1, 10),
    ),
    Movement(
      id: 3,
      categoryId: 2,
      title: 'Burger King',
      quantity: 10.0,
      date: DateTime.now(),
    ),
  ];

  Category getCategoryById(int id) {
    for (Movement movimiento in movementList) {
      for (Category categoria in categoryList) {
        if (movimiento.categoryId == categoria.id) return categoria;
      }
    }
    return null;
  }
}
