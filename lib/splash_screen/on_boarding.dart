// ignore_for_file: deprecated_member_use
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../screens/home_screen.dart';
import '../signin/student_faclty_profilecreation.dart';
import '../widgets/button_Container.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        showBackButton: false,
        showNextButton: true,
        pages: [
          PageViewModel(
            image: const Image(image: AssetImage('assets/images/SCIPRO.png')),
            title: 'WELCOME TO ',
            body: 'SCI PRO',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image: const Image(image: AssetImage('assets/images/SCIPRO.png')),
            title: 'Your Dream JOB \n Is closer than you think',
            body: 'SCI PRO',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image: const Image(image: AssetImage('assets/images/SCIPRO.png')),
            title: 'Welcome  to new phase of \n Eduction',
            body: 'SCI PRO',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image: const Image(image: AssetImage('assets/images/SCIPRO.png')),
            title: 'Thank you for your patience\n Please Wait.... ',
            body: 'SCI PRO',
            decoration: getPageDecoration(),
            footer: ButtonWidget(
              text: 'Lauch App ',
              onClicked: () => goToHome(context),
            ),
          ),
        ],
        done: const Text(
          'Read',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onDone: () => goToOnboard(context),
        showSkipButton: true,
        skip: const Text('Skip', style: TextStyle(color: Colors.black)),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        onChange: (index) => log('page $index selected'),
        dotsDecorator: getDotsDecorator(),
        animationDuration: 1000,
      ),
    );
  }

  void goToHome(context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));

  void goToOnboard(context) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const Onboardingpage()));

  // Widget buildimages(String path) {
  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, color: Colors.black),
        bodyTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        imagePadding: EdgeInsets.all(2),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
      color: Colors.amber,
      activeColor: Colors.red,
      size: const Size(12, 12),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Get.offAll(StudentandFacultyCreationPage());
        },
        child: ButtonContainerWidget(
          curving: 30,
          colorindex: 1,
          height: 60,
          width: 200,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      );
}
//  RaisedButton(
//         onPressed: onClicked,
//         color: Colors.orange,
//         shape: const StadiumBorder(),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         child: Text(
//           text,
//           style: const TextStyle(color: Colors.black, fontSize: 16),
//         ),
//       );