import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/widgets/button.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Favorite',
          style: TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset('assets/images/empty_cart.png'),
          Padding(
            padding: const EdgeInsets.all(padding),
            child: Text(
              'Your favorite is still empty. Go back to the menu and choose your favorite food for the day.',
              style: TextStyle(
                  fontFamily: 'Gilmer',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: black),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
              text: 'Go to menu',
              background: orange2,
              foreground: white,
              onTap: () {})
        ],
      ),
    );
  }
}
