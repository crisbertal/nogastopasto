import 'package:flutter/material.dart';

class MovementsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (_, __) => ListTile(
        title: Text('Concepto movimiento'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Cantidad restante / Cantidad maxima'),
            Text('Nombre categoria'),
          ],
        ),
        trailing: Text('Cantidad: 20'),
        leading: Text('Fecha'),
      ),
      separatorBuilder: (_, index) => Divider(),
    );
  }
}
