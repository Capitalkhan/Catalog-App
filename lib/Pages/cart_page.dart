import 'package:flutter/material.dart';
import 'package:initial_project/core/store.dart';
import 'package:initial_project/models/cart.dart';
import 'package:initial_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make().centered(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context,dynamic, _){
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(MyThemes.darkBluishColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet.".text.make(),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyThemes.darkBluishColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "!Nothing to show".text.xl3.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(
                  Icons.remove_circle_outline,
                ),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  // _cart.remove(_cart.items[index]);
                  // setState(() {});
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
