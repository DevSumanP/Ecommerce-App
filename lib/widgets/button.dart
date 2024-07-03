import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;
  final Function()? onTap;
  const MyButton(
      {super.key,
      required this.text,
      required this.background,
      required this.foreground,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: background,
            foregroundColor: foreground,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(
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
}
