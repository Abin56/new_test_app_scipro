import 'package:flutter/material.dart';
import 'package:scipro_application/signin/google_Auth.dart';
import '../widgets/custom_button.dart';

class Gsignin extends StatefulWidget {
  const Gsignin({Key? key}) : super(key: key);

  @override
  State<Gsignin> createState() => _GsigninState();
}

class _GsigninState extends State<Gsignin> {
  // final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome to SciPro',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/SCIPRO.png'),
          ),
          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              await GoogleSiginController().googleLogin(context);
              // bool res = await _authMethods.signInWithGoogle(context);
              // if (res) {
              //   Get.offAll(Stud)
              // }
              // Get.offAll(stu)
            },
          ),
        ],
      ),
    );
  }
}
