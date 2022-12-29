import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:scipro_application/faculty_screens/list_of_courses.dart';
import 'package:scipro_application/widgets/button_Container.dart';

class FacultyLoginIdScreen extends StatefulWidget {
  const FacultyLoginIdScreen({super.key});

  @override
  State<FacultyLoginIdScreen> createState() => _FacultyLoginIdScreenState();
}

class _FacultyLoginIdScreenState extends State<FacultyLoginIdScreen> {
  @override
  void initState() {
    super.initState();
    getFacultyId();
    getPassword();
  }

  String _facultyId = "loading";
  String _password = "loading";
  TextEditingController idContoller = TextEditingController();

  TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("facaluty id and password screen section");
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            LottieBuilder.asset('assets/images/ld_password_lottie.json'),
            TextField(
              controller: idContoller,
              decoration: InputDecoration(
                  hintText: "Enter your ID",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordContoller,
              decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                // Get.to(FacultyLiveCourseList());
                if (idContoller.text.trim() == 'SCIPRO#123' &&
                    passwordContoller.text.trim() == 'faculty123') {
                  Get.to(FacultyLiveCourseList());
                  log('activated');
                } else {
                  Get.snackbar("Alert", '',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      messageText: Text(
                        'Wrong Password',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ));
                }
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 60,
                width: 200,
                child: const Center(
                  child: Text(
                    "Enter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getFacultyId() async {
    var vari = await FirebaseFirestore.instance
        .collection("FacultyProfiles")
        .doc()
        .get();
    setState(() {
      _facultyId = vari.data()!['facultyid'];
    });
  }

  void getPassword() async {
    var vari = await FirebaseFirestore.instance
        .collection("FacultyProfiles")
        .doc()
        .get();
    setState(() {
      _password = vari.data()!['facultyPassword'];
    });
  }
}
