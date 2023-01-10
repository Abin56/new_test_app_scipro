// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scipro_application/student_screens/Student_waiting_room.dart';
import 'package:scipro_application/video_player/videoplayer_firebase.dart';
import 'package:scipro_application/widgets/button_Container.dart';

class PreviousStudentCourseList extends StatelessWidget {
  const PreviousStudentCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your Course'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () async {
                final currentUser = FirebaseAuth.instance.currentUser!.email;
                log(currentUser.toString());

                CollectionReference cat =
                    FirebaseFirestore.instance.collection("JSALiveCourse");
                Query query = cat.where("Email", isEqualTo: currentUser);
                QuerySnapshot querySnapshot = await query.get();
                final docData =
                    querySnapshot.docs.map((doc) => doc.data()).toList();
                log(docData.toString());
                if (docData.isNotEmpty) {
                  log("set");
                  Get.to(StudentWaitingRoom(
                      id: 'h4X84nKUWxWBvoCn1S6j',
                      roomID: '',
                      courseName: "JSALiveCourse",
                      time: ""));
                } else {
                  final currentname =
                      FirebaseAuth.instance.currentUser!.displayName;
                  Get.snackbar(
                    "${currentname}",
                    ' You are not Subscribed',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    messageText: Text(
                      'You are not Subscribed',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  );
                  log("error");
                }
              },
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text('JSA Live Course',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () async {
                final currentUser = FirebaseAuth.instance.currentUser!.email;
                log(currentUser.toString());

                CollectionReference cat =
                    FirebaseFirestore.instance.collection("JSARecordedCourse");
                Query query = cat.where("Email", isEqualTo: currentUser);
                QuerySnapshot querySnapshot = await query.get();
                final docData =
                    querySnapshot.docs.map((doc) => doc.data()).toList();
                log(docData.toString());
                if (docData.isNotEmpty) {
                  log("set");

                  // Get.to(RecordedvideosPlayList(videoPath: 'JSA@SCI1R'));
                } else {
                  final currentname =
                      FirebaseAuth.instance.currentUser!.displayName;
                  Get.snackbar(
                    "${currentname}",
                    ' You are not Subscribed',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    messageText: Text(
                      'You are not Subscribed',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  );
                  log("error");
                }
              },
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text('JSA Recorded Course',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () async {
                final currentUser = FirebaseAuth.instance.currentUser!.email;
                log(currentUser.toString());

                CollectionReference cat =
                    FirebaseFirestore.instance.collection("JLALiveCourse");
                Query query = cat.where("Email", isEqualTo: currentUser);
                QuerySnapshot querySnapshot = await query.get();
                final docData =
                    querySnapshot.docs.map((doc) => doc.data()).toList();
                log(docData.toString());
                if (docData.isNotEmpty) {
                  log("set");
                  Get.to(StudentWaitingRoom(
                      id: 'e0hyerGmdEAHf2rwNYYC',
                      roomID: '',
                      courseName: "JLALiveCourse",
                      time: ""));
                } else {
                  final currentname =
                      FirebaseAuth.instance.currentUser!.displayName;
                  Get.snackbar(
                    "${currentname}",
                    ' You are not Subscribed',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    messageText: Text(
                      'You are not Subscribed',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  );
                  log("error");
                }
              },
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text('JLA Live Course',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () async {
                final currentUser = FirebaseAuth.instance.currentUser!.email;
                log(currentUser.toString());

                CollectionReference cat =
                    FirebaseFirestore.instance.collection("JLARecordedCourse");
                Query query = cat.where("Email", isEqualTo: currentUser);
                QuerySnapshot querySnapshot = await query.get();
                final docData =
                    querySnapshot.docs.map((doc) => doc.data()).toList();
                log(docData.toString());
                if (docData.isNotEmpty) {
                  log("set");

                  // Get.to(RecordedvideosPlayList(videoPath: 'JLA@SCI1R'));
                } else {
                  final currentname =
                      FirebaseAuth.instance.currentUser!.displayName;
                  Get.snackbar(
                    "${currentname}",
                    ' You are not Subscribed',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    messageText: Text(
                      'You are not Subscribed',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  );
                  log("error");
                }
              },
              child: ButtonContainerWidget(
                  curving: 30,
                  colorindex: 0,
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text('JLA Recorded Course',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
// Future<dynamic> deleteCategory({required context, required id}) async {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text("Alert"),
//         content: const Text(
//           "Are You Sure to delete the Category ?",
//           style: TextStyle(fontSize: 18),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text("Cancel")),
//           TextButton(
//               onPressed: () async {
//                 log(id);
//                 homeController.delteCategoryformFireBase(id).then((value) {
//                   Get.back();
//                   Get.snackbar("Message", 'Deleted',
//                       backgroundColor: Colors.red, colorText: Colors.white);
//                 });
//               },
//               child: const Text("Ok")),
//         ],
//       );
//     },
//   );
// }
        //  await FirebaseAuth.instance.currentUser!.email;
        //         log('${currentUser}');
        //         if (jSALiveStudents.contains(currentUser)) {
        //           log('Correct');
        //           await Get.to(Sample());
        //         } else {
        //           log('ERROR');
        //           Get.snackbar(
        //             "${currentUser}",
        //             ' You are not Subscribed',
        //             backgroundColor: Colors.red,
        //             colorText: Colors.white,
        //             messageText: Text(
        //               'You are not Subscribed',
        //               style: GoogleFonts.montserrat(
        //                   color: Colors.white,
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w700),
        //             ),
        //           );
        //         }