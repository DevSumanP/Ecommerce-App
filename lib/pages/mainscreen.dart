import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/pages/screens/cart.dart';
import 'package:ecommerce/pages/screens/favorite.dart';
import 'package:ecommerce/pages/screens/home.dart';
import 'package:ecommerce/pages/screens/products.dart';
import 'package:ecommerce/pages/screens/profile.dart';
import 'package:ecommerce/widgets/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    PopularFoods(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    bool hasItem = Provider.of<CartModel>(context).hasItem;
    return Scaffold(
      body: Center(
        child: _pages.elementAt(selectedIndex), //New
      ),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped, hasItem: hasItem,
      ),
    ); 
  }
}
