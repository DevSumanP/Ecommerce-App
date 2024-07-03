import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController promoCode = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Cart',
          style: TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: black),
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child:
                  CircularProgressIndicator(), // Display circular progress indicator
            );
          } else if (value.cartItems.isEmpty) {
            return Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset('assets/images/empty_cart.png'),
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Text(
                    'Your plate is still empty. Go back to the menu and choose your mood for the day. Free shipping from Rs.300',
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
            );
          } else {
            return Column(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: 350,
                    child: Expanded(
                        child: ListView.builder(
                            itemCount: value.cartItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    padding, 8, padding, 8),
                                child: Container(
                                  //color: whitesomke,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(24, 64, 64, 64),
                                          offset: Offset(0, 2),
                                          blurRadius: 2),
                                      BoxShadow(
                                          color: Color.fromARGB(24, 64, 64, 64),
                                          offset: Offset(2, 0),
                                          blurRadius: 2),
                                    ],
                                    color: whitesomke,
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 8),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        value.cartItems[index]['image']
                                            .toString(),
                                        height: 200,
                                      ),
                                    ),
                                    title: Text(
                                      value.cartItems[index]['name'],
                                      style: TextStyle(
                                          fontFamily: 'Gilmer',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: black),
                                    ),
                                    // ignore: prefer_interpolation_to_compose_strings
                                    subtitle: Text(
                                      'Rs.${value.cartItems[index]['price']}',
                                      style: TextStyle(
                                          fontFamily: 'Gilmer',
                                          color: lightGrey),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: () {
                                        Provider.of<CartModel>(context,
                                                listen: false)
                                            .removeItemFromCart(index);
                                      },
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ),
                ),
                const Divider(),
                SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(padding),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              fillColor:
                                  const Color.fromARGB(186, 229, 229, 229),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(15, 30, 15, 2),
                              hintMaxLines: 1,
                              hintText: 'Add promo code'),
                          style: TextStyle(
                            fontFamily: 'Gilmer',
                            fontSize: 15,
                            color: lightBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            padding, 0, padding, padding),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(186, 229, 229, 229),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    padding, padding, padding, 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: TextStyle(
                                        fontFamily: 'Gilmer',
                                        fontSize: 15,
                                        color: lightGrey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Rs ${value.calculateSubTotal()}',
                                      style: TextStyle(
                                        fontFamily: 'Gilmer',
                                        fontSize: 15,
                                        color: lightGrey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    padding, 4, padding, 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Delivery fee',
                                      style: TextStyle(
                                        fontFamily: 'Gilmer',
                                        fontSize: 15,
                                        color: lightGrey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'Free',
                                      style: TextStyle(
                                        fontFamily: 'Gilmer',
                                        fontSize: 15,
                                        color: lightGrey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    padding, 4, padding, 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Discount',
                                      style: TextStyle(
                                        fontFamily: 'Gilmer',
                                        fontSize: 15,
                                        color: lightGrey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '- Rs 30',
                                      style: TextStyle(
                                        fontFamily: 'Gilmer',
                                        fontSize: 15,
                                        color: lightGrey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    padding, padding, padding, 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                        fontFamily: 'Gilmer',
                                        fontSize: 20,
                                        color: black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Rs ${value.calculateTotal()}',
                                      style: TextStyle(
                                        fontFamily: 'Gilmer',
                                        fontSize: 20,
                                        color: black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MyButton(
                          text: 'Checkout',
                          background: orange2,
                          foreground: white,
                          onTap: () {})
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
