import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:initial_project/models/cart.dart';
import 'package:initial_project/routes/route.dart';
import 'package:initial_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import '../core/store.dart';
import '../models/catalog.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString('assets/files/catalog.json');
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, dynamic, _) => FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.cartRoute);
            },
            backgroundColor: MyThemes.darkBluishColor,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )).badge(
          color: Vx.red500,
          size: 22,
          count: _cart.items.length,
          textStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
