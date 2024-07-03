import 'package:ecommerce/constants/constants.dart';
import 'package:ecommerce/pages/Login/signin.dart';
import 'package:ecommerce/pages/mainscreen.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:ecommerce/widgets/button.dart';
import 'package:ecommerce/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUpWithEmailPassword() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (_passwordController == _emailController) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
      } else {
        showErrorMessage('Password do not match');
      }
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
                  TextStyle(fontFamily: 'Gilmer', color: black, fontSize: 14),
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
                height: 0.0,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Text(
                    "Sign Up",
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
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: Column(
                  children: [
                    MyTextField(
                      controller: _nameController,
                      hintText: 'Name',
                      icon: IconlyLight.add_user,
                      isObscure: false,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      icon: IconlyLight.message,
                      isObscure: false,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      icon: IconlyLight.call,
                      isObscure: true,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    MyTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      icon: IconlyLight.password,
                      isObscure: true,
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    MyButton(
                      text: 'Sign Up',
                      background: orange2,
                      foreground: white,
                      onTap: () {
                        signUpWithEmailPassword();
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Checkbox(
                              overlayColor: MaterialStateProperty.all(orange2),
                              side: BorderSide(color: orange2, width: 2),
                              value: false,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (value) {},
                            ),
                          ),
                          Text(
                            'I agree to the ',
                            style: TextStyle(
                                fontFamily: 'Gilmer',
                                fontSize: 14,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                                color: black),
                          ),
                          Text(
                            'terms & conditions',
                            style: TextStyle(
                                fontFamily: 'Gilmer',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: orange2),
                          ),
                          Text(
                            ' and ',
                            style: TextStyle(
                                fontFamily: 'Gilmer',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: black),
                          ),
                          Text(
                            'policy.',
                            style: TextStyle(
                                fontFamily: 'Gilmer',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: orange2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Or Sign up using',
                      style: TextStyle(
                          fontFamily: 'Gilmer',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: black),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () => AuthService().signInWithGoogle(),
                            child: socialMedia('assets/images/google.png')),
                        socialMedia('assets/images/facebook.png'),
                        socialMedia('assets/images/email.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                              fontFamily: 'Gilmer',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: grey),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => const SignIn()),
                          child: Text(
                            'Sign In',
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
