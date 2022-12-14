import 'package:flutter/material.dart';
import 'package:quitandavirtual/components/payment_dialog.dart';
import 'package:quitandavirtual/config/custom_colors.dart';
import 'package:quitandavirtual/models/cart_item_model.dart';
import 'package:quitandavirtual/tiles/cart_tile.dart';
import 'package:quitandavirtual/utils/utils_services.dart';
import 'package:quitandavirtual/config/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItemModel) {
    setState(() {
      appData.cartItens.remove(cartItemModel);

      utilsServices.showToast(message: '${cartItemModel.item.itemName} removido(a) do carrinho');
    });
  }

  double cartTotalPrice() {
    double total = 0.0;

    for (var item in appData.cartItens) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItens.length,
              itemBuilder: (_, index) {
                return CartTile(
                    cartItemModel: appData.cartItens[index],
                    remove: removeItemFromCart);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total geral',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                      fontSize: 23,
                      color: CustomColors.customSwatchColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();

                      if(result ?? false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(order: appData.orders.first);
                          },
                        );
                      } else {
                        utilsServices.showToast(message: 'Pedido n??o confirmado', isError: true);
                      }
                    },
                    child: const Text(
                      'Concluir pedido',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            title: const Text('Confirma????o'),
            content: const Text('Deseja realmente concluir o pedido?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("N??o"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Sim"),
            )
          ],
        );
      },
    );
  }
}
