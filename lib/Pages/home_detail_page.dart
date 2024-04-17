import 'package:flutter/material.dart';
import 'package:initial_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../widgets/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyThemes.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(

          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
           AddToCart(catalog).wh(150, 50)
          ],
        ).p32(),
      ) ,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(MyThemes.darkBluishColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor ".text.textStyle(context.captionStyle).make().p16(),
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
