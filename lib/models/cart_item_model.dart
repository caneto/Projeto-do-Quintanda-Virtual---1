import 'package:quitandavirtual/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });
}
