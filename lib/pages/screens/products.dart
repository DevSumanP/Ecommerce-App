import 'dart:convert';
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import 'product_page.dart';

class PopularFoods extends StatefulWidget {
  const PopularFoods({super.key});

  @override
  State<PopularFoods> createState() => _PopularFoodsState();
}

class _PopularFoodsState extends State<PopularFoods> {
  List<dynamic> items = [];
  List<dynamic> filteredItems = [];
  @override
  void initState() {
    super.initState();

    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/images/catalog.json');
    final jsonData = json.decode(jsonString);
    setState(() {
      items = jsonData['products'];
      filteredItems = List.from(items);
    });
  }

  void updateList(String value) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'All Popular Foods',
          style: TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: black),
        ),
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(padding, 0, padding, padding),
              child: SizedBox(
                height: 45,
                child: TextFormField(
                  onChanged: (value) => updateList(value),
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    fillColor: Color.fromARGB(77, 130, 130, 130),
                    filled: true,
                    prefixIconColor: white,
                    prefixIcon: Icon(
                      IconlyLight.search,
                      size: 18,
                      color: black,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                    contentPadding:
                        const EdgeInsets.fromLTRB(padding * 3, 0, padding, 0),
                    hintText: 'Search your favorite foods..',
                    hintStyle: TextStyle(
                        fontFamily: 'Gilmer', fontSize: 15, color: black),
                  ),
                  style: TextStyle(
                    fontFamily: 'Gilmer',
                    fontSize: 15,
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              child: Container(
                height: 600,
                width: double.infinity,
                padding: EdgeInsets.zero,
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return MyCard(
                      name: filteredItems[index]['name'],
                      description: filteredItems[index]['desc'],
                      price: filteredItems[index]['price'].toString(),
                      imageUrl: filteredItems[index]['image'].toString(),
                      onTap: () {
                        Get.off(
                          () => ProductDetailPage(
                            product: items[index],
                            index: index,
                          ),
                        );
                      },
                      addItem: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
