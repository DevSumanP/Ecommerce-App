import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/pages/Login/signin.dart';
import 'package:ecommerce/widgets/profileButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding:
                const EdgeInsets.fromLTRB(padding, padding, padding, padding),
            child: InkWell(
              onTap: () {},
              child: Icon(
                FluentIcons.settings_16_regular,
                color: black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL.toString()),
              radius: 60,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user!.displayName == null ? 'User' : user!.displayName.toString(),
            style: TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 22,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            user!.email.toString(),
            style: TextStyle(
              fontFamily: 'Gilmer',
              fontSize: 16,
              color: lightGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          MyProfileButton(
              text: 'Order History',
              color: lightBlack,
              textcolor: lightBlack,
              icon: FluentIcons.book_20_regular,
              onTap: () {}),
          const SizedBox(
            height: 15,
          ),
          MyProfileButton(
              text: 'Delivery Address',
              color: lightBlack,
              textcolor: lightBlack,
              icon: FluentIcons.location_16_regular,
              onTap: () {}),
          const SizedBox(
            height: 15,
          ),
          MyProfileButton(
              text: 'Payment',
              color: lightBlack,
              textcolor: lightBlack,
              icon: FluentIcons.payment_16_regular,
              onTap: () {}),
          const SizedBox(
            height: 15,
          ),
          MyProfileButton(
              text: 'Notifications',
              color: lightBlack,
              textcolor: lightBlack,
              icon: FluentIcons.alert_16_regular,
              onTap: () {}),
          const SizedBox(
            height: 15,
          ),
          MyProfileButton(
              text: 'Help and Support',
              color: lightBlack,
              textcolor: lightBlack,
              icon: FluentIcons.headphones_20_regular,
              onTap: () {}),
          const SizedBox(
            height: 15,
          ),
          MyProfileButton(
            text: 'Log out',
            icon: FluentIcons.arrow_exit_20_regular,
            textcolor: orange2,
            color: orange2,
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(
                        semanticsLabel: 'Logging out',
                        color: white,
                      ),
                    );
                  });

              await Future.delayed(const Duration(seconds: 4));
              Rx<GoogleSignInAccount?>(null).value =
                  await GoogleSignIn().signOut();
              // ignore: use_build_context_synchronously
              Get.off(() => const SignIn());
            },
          ),
        ],
      ),
    );
  }
}
