// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scipro_application/signin/student_faculty_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splash_screen/on_boarding.dart';

class GoogleSiginController {
  final FirebaseAuth firebase = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future gooleSignOUt() async {
    try {
      await googleSignIn.signOut();
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: Colors.red, colorText: Colors.black);
    } catch (e) {
      log(e.toString());
    }
  }

  googleLogin(context) async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }
      _user = googleUser;
//
      final googleAuth = await _user!.authentication;
      // log(_user.toString());

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        FirebaseFirestore.instance
            .collection('allUserData')
            .doc(value.user!.uid)
            .set({
          'uid': value.user!.uid,
          'email': value.user!.email,
          'name': value.user!.displayName,
          'phoneNumber': value.user!.phoneNumber,
          'photoURL': value.user!.photoURL,
          'isBlocked': false,
        }).then((value) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool? isOnBoard = prefs.getBool('seenonboard');
          if (isOnBoard == true) {
            log("TRUE");
            Get.offAll(StudentandFacultyLoginScreen());
          } else {
            log("FALSE");
            Get.offAll(Onboardingpage());
          }
        });
      });
      //   .then((value) async {
      // final UserModel data = UserModel(
      //   uid: value.user!.uid,
      //   username: value.user!.displayName!,
      //   password: "",
      //   email: value.user!.email!,
      // );

      // await firestore
      //     .collection("userData")
      //     .doc(value.user!.uid)
      //     .set(data.toJson());
      //   Get.offAll(() => const ScreenHomePage());
      //   Get.snackbar("Done",
      //       "Registration of  ${value.user!.email.toString()} is successful",
      //       backgroundColor: kGreen, colorText: kWhite);
      //   // update();
      //   // return value;
      // });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: Colors.red, colorText: Colors.black);
    } catch (e) {
      log(e.toString());
    }
  }
}
