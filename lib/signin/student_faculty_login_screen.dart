import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scipro_application/screens/home_screen.dart';
import 'package:scipro_application/widgets/button_Container.dart';

import '../faculty_screens/faculty_login_id_screen.dart';
import 'login_previous_students.dart';

class StudentandFacultyLoginScreen extends StatelessWidget {
  const StudentandFacultyLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(const HomeScreen());
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Students",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const FacultyLoginIdScreen());
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 5,
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Faculty",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const PreviousStudentCourseList());
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 3,
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Previous Students",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
