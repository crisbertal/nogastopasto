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
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final int _lineas = 10;
  int _itemSeleccionado = 0;

  static List<Widget> _pestanas = <Widget>[
    MovimientosPage(),
    CategoriasPage(),
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

class MovimientosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (_, data, __) {
        return ListView.separated(
          itemCount: data.listaMovimientos.length,
          itemBuilder: (_, index) {
            if (data.listaMovimientos.length == 0)
              return Center(
                child: Text('No hay movimientos'),
              );
            else
              return ListTile(
                title: Text(data.listaMovimientos.elementAt(index).concepto),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Cantidad gastada / Maximo'),
                    Text(data
                        .getCategoriaById(
                            data.listaMovimientos.elementAt(index).idCategoria)
                        .nombre),
                  ],
                ),
                trailing: Text(
                    'Cantidad: ${data.listaMovimientos.elementAt(index).cantidad}'),
                leading: Text(
                    '${data.listaMovimientos.elementAt(index).getFechaFormateada()}'),
              );
          },
          separatorBuilder: (_, index) => Divider(),
        );
      },
    );
  }
}

class CategoriasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (_, data, __) => ListView.separated(
        itemCount: data.listaCategorias.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(data.listaCategorias.elementAt(index).nombre),
          trailing: Text('Maximo: ' +
              data.listaCategorias.elementAt(index).maximo.toString()),
        ),
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}

class Movimiento {
  final int id;
  final int idCategoria;
  final String concepto;
  final double cantidad;
  final DateTime fecha;

  Movimiento({
    this.id,
    this.idCategoria,
    this.concepto,
    this.cantidad,
    this.fecha,
  });

  String getFechaFormateada() {
    return DateFormat.yMd().format(this.fecha);
  }
}

class Categoria {
  final int id;
  final String nombre;
  final double maximo;

  Categoria({
    this.id,
    this.nombre,
    this.maximo,
  });
}

class DataProvider extends ChangeNotifier {
  List<Categoria> listaCategorias = [
    Categoria(id: 0, nombre: 'Mercadona', maximo: 100.0),
    Categoria(id: 1, nombre: 'Fiesta', maximo: 60.0),
    Categoria(id: 2, nombre: 'Comer fuera', maximo: 30.0),
    Categoria(id: 3, nombre: 'Capricho', maximo: 20.0),
  ];

  List<Movimiento> listaMovimientos = [
    Movimiento(
      id: 0,
      idCategoria: 0,
      concepto: 'Compra mercadona',
      cantidad: 20.0,
      fecha: DateTime(2020, 1, 10),
    ),
    Movimiento(
      id: 1,
      idCategoria: 0,
      concepto: 'Compra mercadona',
      cantidad: 23.0,
      fecha: DateTime(2020, 1, 11),
    ),
    Movimiento(
      id: 2,
      idCategoria: 1,
      concepto: 'Cerveza Vintage',
      cantidad: 3.0,
      fecha: DateTime(2020, 1, 10),
    ),
    Movimiento(
      id: 3,
      idCategoria: 2,
      concepto: 'Burger King',
      cantidad: 10.0,
      fecha: DateTime.now(),
    ),
  ];

  Categoria getCategoriaById(int id) {
    for (Movimiento movimiento in listaMovimientos) {
      for (Categoria categoria in listaCategorias) {
        if (movimiento.idCategoria == categoria.id) return categoria;
      }
    }
    return null;
  }
}
