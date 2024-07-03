// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/widgets/foodcounter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final int index;

  const ProductDetailPage({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    final product = widget.product;
    final int price = product['price'];
    totalPrice = quantity * price;
  }

  void updateQuantity(int value) {
    setState(() {
      quantity = value;
      calculateTotalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Details',
          style: TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: black),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            FluentIcons.arrow_left_16_regular,
            color: black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.network(
                  product['image'],
                  height: 260,
                  width: 260,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            FoodCounter(
              onQuantityChanged: (int value) {
                updateQuantity(value);
              },
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                      color: black),
                ),
                Text(
                  'Rs $totalPrice',
                  style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: orange2),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starRating(),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '(1k reviews)',
                  style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: lightGrey),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec consectetur libero. Fusce non ex eget ex tristique efficitur. Curabitur ac justo mauris. Ut vulputate pellentesque ante, vel posuere lorem vestibulum sed. Suspendisse at mollis turpis, eu cursus massa. Sed facilisis nulla id nunc volutpat, euismod rutrum risus tristique. ',
              style: TextStyle(
                  fontFamily: 'Gilmer',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: lightGrey),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 4,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                calorieWt(),
                const SizedBox(
                  width: 20,
                ),
                foodTime(),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total : Rs $totalPrice',
                  style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: black),
                ),
                const SizedBox(
                  width: 20,
                ),
                addButton(() {
                  Provider.of<CartModel>(context, listen: false)
                      .addItemToCart(widget.index);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget starRating() {
  return Container(
    height: 30,
    width: 70,
    padding: const EdgeInsets.all(0),
    decoration:
        BoxDecoration(color: orange2, borderRadius: BorderRadius.circular(25)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 0.0),
          child: Icon(
            FluentIcons.star_16_regular,
            color: white,
            size: 18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 10.0),
          child: Text(
            '4.9',
            style: TextStyle(
                fontFamily: 'Gilmer',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: white),
          ),
        ),
      ],
    ),
  );
}

Widget foodTime() {
  return Text.rich(
    TextSpan(
      style: TextStyle(
          fontFamily: 'Gilmer',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: lightGrey),
      children: [
        WidgetSpan(
          child: Icon(
            FluentIcons.clock_16_regular,
            color: orange1,
            size: 20,
          ),
        ),
        const TextSpan(
          text: '25min',
        )
      ],
    ),
  );
}

Widget calorieWt() {
  return Text.rich(
    TextSpan(
      style: TextStyle(
          fontFamily: 'Gilmer',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: lightGrey),
      children: [
        WidgetSpan(
          child: Icon(
            FluentIcons.lock_closed_16_regular,
            color: orange1,
            size: 20,
          ),
        ),
        const TextSpan(
          text: '128.6 kkal',
        )
      ],
    ),
  );
}

Widget addButton(onTap) {
  return SizedBox(
    height: 50,
    width: 200,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: orange2,
          foregroundColor: white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      onPressed: onTap,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add to cart',
            style: TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ), // <-- Text
        ],
      ),
    ),
  );
}
