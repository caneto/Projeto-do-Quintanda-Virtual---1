import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitandavirtual/config/app_data.dart';
import 'package:quitandavirtual/config/custom_colors.dart';
import 'package:quitandavirtual/tiles/category_tile.dart';
import 'package:quitandavirtual/tiles/item_tile.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(TextSpan(style: TextStyle(fontSize: 30), children: [
          TextSpan(
              text: "Quitanda",
              style: TextStyle(
                color: CustomColors.customSwatchColor[800],
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: "virtual",
              style: TextStyle(
                color: CustomColors.customContrastColor,
              )),
        ])),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {});
              },
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: Text(
                  "0",
                  style: TextStyle(
                      color: CustomColors.customWhiteColor, fontSize: 12),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquise aqui',
                  hintStyle:
                      TextStyle(color: Colors.grey.shade500, fontSize: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none))),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (_, index) {
                return CategoryTile(
                  category: categories[index],
                  isSelected: categories[index] == selectCategory,
                  onPressed: () {
                    setState(() {
                      selectCategory = categories[index];
                    });
                  },
                );
              },
              separatorBuilder: (_, index) => SizedBox(
                width: 10,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5,
                //childAspectRatio:
              ),
              itemCount: items.length,
              itemBuilder: (_,index) {
                return ItemTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
