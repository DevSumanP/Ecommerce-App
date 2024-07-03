// ignore: file_names
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MyProfileButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  final Color color;
  final Color textcolor;
  const MyProfileButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.icon,
      required this.color,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 350,
      child: Container(
        decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: white,
                offset: const Offset(0, 2),
                blurRadius: 2),
            BoxShadow(
                color: white,
                offset: const Offset(2, 0),
                blurRadius: 2),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.5,
              backgroundColor: const Color.fromARGB(186, 229, 229, 229),
              foregroundColor: black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: color,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textcolor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 100,
              ),
              const Icon(
                FluentIcons.chevron_right_16_regular,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
