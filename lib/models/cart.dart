
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import 'catalog.dart';

class CartModel {
  // static final cartModel = CartModel._internal();
  //
  // CartModel._internal();
  // factory CartModel() => cartModel;


  late CatalogModel _catalog;

  final List<int> _itemsIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total+current.price);



}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemsIds.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemsIds.remove(item.id);
  }

}










