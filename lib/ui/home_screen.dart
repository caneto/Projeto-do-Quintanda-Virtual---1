import 'package:flutter/material.dart';
import 'package:quitandavirtual/config/custom_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customContrastColor,
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.customSwatchColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Carrinho'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Pedido'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.percent_outlined),
              label: 'Perfil'
          )

        ],
      ));
  }
}
