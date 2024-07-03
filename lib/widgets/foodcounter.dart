import 'package:flutter/material.dart';

class FoodCounter extends StatefulWidget {
   final void Function(int) onQuantityChanged;
  const FoodCounter({Key? key, required this.onQuantityChanged}) : super(key: key);

  @override
  State<FoodCounter> createState() => _FoodCounterState();
}

class _FoodCounterState extends State<FoodCounter> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 130,
      decoration: BoxDecoration(
          color: const Color.fromARGB(153, 220, 219, 219),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove,
            size: 20,),
            onPressed: () {
              setState(() {
                quantity--;
                widget.onQuantityChanged(quantity);
              });
            },
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 16),
          ),
          IconButton(
            icon: const Icon(Icons.add,
            size: 20,),
            onPressed: () {
              setState(() {
                quantity++;
                widget.onQuantityChanged(quantity);
              });
            },
          ),
        ],
      ),
    );
  }
}
