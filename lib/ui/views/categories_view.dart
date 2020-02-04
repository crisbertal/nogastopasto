import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (_, __) => ListTile(
        title: Text('Nombre categoria'),
        trailing: Text('Maximo: 20'),
      ),
      separatorBuilder: (_, __) => Divider(),
    );
  }
}
