import 'package:ecommerce/pages/Login/signin.dart';
import 'package:ecommerce/pages/Onboarding/introscreen/introscreen1%20.dart';
import 'package:ecommerce/pages/Onboarding/introscreen/introscreen2.dart';
import 'package:ecommerce/pages/Onboarding/introscreen/introscreen3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/constants.dart';
import '../mainscreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool isLoading = false;
  bool isSkipLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 630,
            child: PageView(
              children: const [
                IntroScreen1(),
                IntroScreen2(),
                IntroScreen3(),
              ],
            ),
          ),
          Container(
            alignment: const Alignment(0, 0),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: SlideEffect(
                  spacing: 3.0,
                  radius: 8.0,
                  dotWidth: 8.0,
                  dotHeight: 8.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: lightGrey,
                  activeDotColor: orange2),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: orange2,
                  foregroundColor: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await Future.delayed(const Duration(seconds: 3));
                Get.to(() => const SignIn());
              },
              child: (isLoading)
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1.5,
                      ))
                  : const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            fontFamily: 'Gilmer',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ), // <-- Text
                      ],
                    ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: white,
                  foregroundColor: grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
              onPressed: () async {
                setState(() {
                  isSkipLoading = true;
                });
                await Future.delayed(const Duration(seconds: 3));
                Get.to(() => const MainScreen());
              },
              child: (isSkipLoading)
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: black,
                        strokeWidth: 1.5,
                      ))
                  : const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Gilmer',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ), // <-- Text
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget myNextButton(background, foreground, text) {
//   return SizedBox(
//     height: 50,
//     width: 350,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           elevation: 0,
//           backgroundColor: background,
//           foregroundColor: foreground,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
//       onPressed: () {
//         Get.to(const SignIn());
//       },
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//               fontFamily: 'Gilmer',
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ), // <-- Text
//         ],
//       ),
//     ),
//   );
// }

// Widget mySkipButton(background, foreground, text) {
//   return SizedBox(
//     height: 50,
//     width: 350,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           elevation: 0,
//           backgroundColor: background,
//           foregroundColor: foreground,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
//       onPressed: () {
//         Get.to(const MainScreen());
//       },
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//               fontFamily: 'Gilmer',
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ), // <-- Text
//         ],
//       ),
//     ),
//   );
// }
