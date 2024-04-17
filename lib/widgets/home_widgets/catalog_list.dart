import 'package:flutter/material.dart';
import 'package:initial_project/Pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  catalog: catalog,
                ),
              ),
            );
          },
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
    );
  }
}
