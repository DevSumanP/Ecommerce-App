import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class OfferScreen extends StatelessWidget {
  final String offer;
  const OfferScreen( {super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              offer,
              height: 180,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            )),
        Positioned(
          left: 0,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get your first order at',
                  style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '50% discount',
                  style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: orange2),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
