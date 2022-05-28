import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item? item;

  const ItemWidget({Key? key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        leading: Image.network(item!.image),
        title: Text(
          item!.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(item!.desc),
        trailing: Text(
          '\$${item!.price}',
          style:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
