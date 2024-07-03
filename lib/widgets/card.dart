// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

// ignore: must_be_immutable
class MyCard extends StatefulWidget {
  String name;
  String description;
  String price;
  String imageUrl;
  Function()? onTap;
  Function()? addItem;

  MyCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.onTap,
    required this.addItem,
  }) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(padding, 0, padding, padding),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 0.5,
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color:whitesomke,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.029999999329447746),
                    offset: Offset(0, 25),
                    blurRadius: 40)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.network(
                        widget.imageUrl,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: padding),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontFamily: 'Gilmer',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        widget.description,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'Gilmer',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: lightGrey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rs,${widget.price}',
                      style: TextStyle(
                        fontFamily: 'Gilmer',
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: orange2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              FluentIcons.clock_16_regular,
                              size: 18,
                              color: orange2,
                            ),
                            Text(
                              '25 min',
                              style: TextStyle(
                                fontFamily: 'Gilmer',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: lightGrey,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: padding * 6),
                          child: FloatingActionButton(
                            onPressed: widget.addItem,
                            mini: true,
                            focusColor: orange2,
                            backgroundColor: orange2,
                            elevation: 0,
                            child: const Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
