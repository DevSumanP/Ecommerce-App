import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/pages/Login/signup.dart';
import 'package:ecommerce/pages/mainscreen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/widgets/button.dart';
import 'package:ecommerce/widgets/passwordfield.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signInWithEmailPassword() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainScreen()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: white,
            title: Center(
                child: Text(
              message,
              style:
                  TextStyle(fontFamily: 'Gilmer', fontSize: 14, color: black),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back,
          color: black,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.fromLTRB(padding, 0, padding, padding),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gilmer',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: Column(
                  children: [
                    MyTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      icon: IconlyLight.message,
                      isObscure: false,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyPasswordField(
                      controller: _passwordController,
                      hintText: 'Password',
                      icon: IconlyLight.message,
                      isObscure: true,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            fontFamily: 'Gilmer',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: orange2),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    MyButton(
                      text: 'Sign in',
                      background: orange2,
                      foreground: white,
                      onTap: () {
                        signInWithEmailPassword();
                      },
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Or Sign in with',
                      style: TextStyle(
                          fontFamily: 'Gilmer',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: black),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              await Future.delayed(const Duration(seconds: 4));
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                              AuthService().signInWithGoogle();
                            },
                            child: socialMedia('assets/images/google.png')),
                        socialMedia('assets/images/facebook.png'),
                        socialMedia('assets/images/email.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't have an account? ",
                          style: TextStyle(
                              fontFamily: 'Gilmer',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: grey),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => const SignUp()),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                fontFamily: 'Gilmer',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: orange2),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget socialMedia(url) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            url,
            height: 20,
            width: 20,
          ),
        ),
      ),
    ),
  );
}
