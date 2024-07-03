// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(padding, 8, padding, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ooorder.',
                        style: TextStyle(
                            fontFamily: 'Gilmer',
                            fontSize: 22,
                            color: black,
                            fontWeight: FontWeight.w800),
                      ),
                      _location('Shankhamul, Kathmandu'),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(padding,padding,0,padding),
                        child: Icon(IconlyLight.search),
                      )),
                  GestureDetector(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0,padding,padding,padding),
                        child: Icon(IconlyLight.notification),
                      )),
                ],
              ),
            ),
          ]),
    );
  }
}

Widget _location(location) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        IconlyLight.location,
        color: orange2,
        size: 18,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        location,
        style: TextStyle(
            fontFamily: 'Gilmer',
            fontSize: 14,
            color: lightGrey,
            fontWeight: FontWeight.w400),
      ),
    ],
  );
}

Widget searchBar() {
  return GestureDetector(
    child: SizedBox(
      height: 45,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          fillColor: lightGrey,
          filled: true,
          prefixIconColor: white,
          prefixIcon: const Icon(
            IconlyLight.search,
            size: 18,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.fromLTRB(padding * 3, 0, padding, 0),
          hintText: 'Search',
          hintStyle:
              TextStyle(fontFamily: 'Gilmer', fontSize: 15, color: white),
        ),
        style: TextStyle(
          fontFamily: 'Gilmer',
          fontSize: 15,
          color: white,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
