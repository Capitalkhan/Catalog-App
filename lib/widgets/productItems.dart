
import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ProductItems extends StatelessWidget {
  final Item item;
  ProductItems(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",style: const TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),textScaler: TextScaler.linear(1.5),),
      ),
    );
  }
}
