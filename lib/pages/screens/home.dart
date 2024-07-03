import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/pages/screens/product_page.dart';
import 'package:ecommerce/pages/screens/products.dart';
import 'package:ecommerce/widgets/appbar.dart';
import 'package:ecommerce/widgets/card.dart';
import 'package:ecommerce/widgets/offers.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();

  late int _choiceIndex;

  late List<String> _choices;

  @override
  void initState() {
    super.initState();
    Provider.of<CartModel>(context, listen: false).loadJsonData();
    _choiceIndex = 0;
    _choices = ["All", "Burger", "Noodles", "Pizza"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MyAppBar(),
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(padding, 0, padding, padding),
                  child: SizedBox(
                    height: 180,
                    child: PageView(
                      controller: _controller,
                      children: const [
                        OfferScreen(offer: 'assets/images/offer1.jpg'),
                        OfferScreen(
                          offer: 'assets/images/offer2.jpg',
                        ),
                        OfferScreen(
                          offer: 'assets/images/intro2.jpg',
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 180,
                  top: 160,
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: SlideEffect(
                        spacing: 3.0,
                        radius: 8.0,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        paintStyle: PaintingStyle.fill,
                        strokeWidth: 1.5,
                        dotColor: white,
                        activeDotColor: orange2),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(padding, 5, padding, 5),
              child: Text(
                'Whats your mood today ?',
                style: TextStyle(
                    fontFamily: 'Gilmer',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: padding, right: padding),
              child: Row(
                children: [
                  SizedBox(
                    height: 70,
                    width: 360,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _choices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            avatar: Icon(
                              FluentIcons.food_16_regular,
                              size: 18,
                              color: white,
                            ),
                            label: Text(_choices[index]),
                            selected: _choiceIndex == index,
                            selectedColor: orange2,
                            onSelected: (bool selected) {
                              setState(() {
                                _choiceIndex = selected ? index : 0;
                              });
                            },
                            backgroundColor: Colors.grey.shade500,
                            labelStyle:
                                TextStyle(fontFamily: 'Gilmer', color: white),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(padding, padding, padding, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular food you can get',
                    style: TextStyle(
                        fontFamily: 'Gilmer',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PopularFoods()));
                    },
                    child: Text(
                      'View all',
                      style: TextStyle(
                          fontFamily: 'Gilmer',
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: orange2),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 290,
              width: double.infinity,
              padding: EdgeInsets.zero,
              child: Consumer<CartModel>(builder: (context, value, child) {
                return ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: value.items.length,
                  itemBuilder: (context, index) {
                    return MyCard(
                      name: value.items[index]['name'],
                      description: value.items[index]['desc'],
                      price: value.items[index]['price'].toString(),
                      imageUrl: value.items[index]['image'].toString(),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                      product: value.items[index],
                                      index: index,
                                    )));
                      },
                      addItem: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                        
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
