import 'package:flutter/material.dart';
import '../signin/student_faculty_login_screen.dart';

class Splashscreen extends StatelessWidget {
// final examplecontoler = Get.find<StateGetx>()
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goHomeScreen(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("assets/images/SCIPRO.png"),
      ),
    );
  }

  // ignore: non_constant_identifier_names

}

goHomeScreen(context) async {
  await Future.delayed(const Duration(seconds: 3));
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const StudentandFacultyLoginScreen()));
}
