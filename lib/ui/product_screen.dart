import 'package:flutter/material.dart';
import 'package:quitandavirtual/models/item_model.dart';

class ProductScreen extends StatelessWidget {
  final ItemModel item;

  const ProductScreen({Key? key, required this.item}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),

      body: Column(
        children: [
          Expanded(child: Image.asset(item.imgUrl)),
          Expanded(child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.shade600,
                    offset: Offset(0,2)
                  )
                ]),
          ))
        ],
      ),
    );
  }
}
