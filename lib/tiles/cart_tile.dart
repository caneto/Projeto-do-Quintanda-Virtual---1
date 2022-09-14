import 'package:flutter/material.dart';
import 'package:quitandavirtual/models/cart_item_model.dart';

class CartTile extends StatelessWidget {
  const CartTile({Key? key, required this.cartItemModel}) : super(key: key);

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cartItemModel.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(cartItemModel.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
