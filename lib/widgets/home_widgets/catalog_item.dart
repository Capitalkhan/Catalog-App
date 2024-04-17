import 'package:flutter/material.dart';
import 'package:initial_project/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(
              catalog.id.toString(),
            ),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyThemes.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog),
                ],
              ).pOnly(right: 6.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}


