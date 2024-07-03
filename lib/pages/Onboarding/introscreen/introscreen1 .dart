import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)),
            child: Image.asset(
              'assets/images/intro1.jpg',
              height: 450,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            )),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Top Chefs',
          style: TextStyle(
              fontFamily: 'Gilmer', fontSize: 28, fontWeight: FontWeight.w900),
        ),
        const Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Cum sociis natoque penatibus et',
            style: TextStyle(
                fontFamily: 'Gilmer',
                fontSize: 16,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
