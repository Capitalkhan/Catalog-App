import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:initial_project/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart(this.catalog);


  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on:[AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // isInCart = isInCart.toggle();
          // final _catalog = CatalogModel();
          // _cart.catalog = _catalog;
          // _cart.add(catalog);
          // setState(() {});
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyThemes.darkBluishColor,
          ),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart
          ? Icon(
        Icons.done,
        color: Colors.white,
      )
          : Icon(CupertinoIcons.cart_badge_plus,color: Colors.white,),
    );
  }
}