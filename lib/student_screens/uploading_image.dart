// // ignore_for_file: prefer_const_constructors_in_immutables

// import 'dart:developer';
// import 'dart:io';
// import 'dart:ui';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:scipro/faculty_screens/faculty_home_screen.dart';
// import 'package:scipro/student_screens/student_profilecreation.dart';

// class UploadImageForStudent extends StatefulWidget {

//   UploadImageForStudent({ super.key});

//   @override
//   State<UploadImageForStudent> createState() => _UploadImageForStudentState();
// }

// class _UploadImageForStudentState extends State<UploadImageForStudent> {
//   PlatformFile? pickeimagefile;
//   UploadTask? uploadTask;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBody: true,
//         body: Stack(
//           children: [
//             const DesignoneOffer(),
//             const DesignTwooffer(),
//             SafeArea(
//               child: Scaffold(
//                 body: ListView(
//                   children: [
//                     Container(
//                       height: 800.h,
//                       width: 200.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         border:
//                             Border.all(color: Colors.white.withOpacity(0.13)),
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.white.withOpacity(0.10),
//                             Colors.white.withOpacity(0.10)
//                           ],
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           SizedBox(height: 20.h),
//                           const Text(
//                             'Upload Image!',
//                             style: TextStyle(fontSize: 32),
//                           ),
//                           SizedBox(height: 20.h),
//                           Container(
//                             height: 200.h,
//                             // color: Colors.amber,
//                             decoration: BoxDecoration(
//                                 border:
//                                     Border.all(color: Colors.white, width: 3),
//                                 color: Colors.transparent,
//                                 shape: BoxShape.circle),
//                             child: pickeimagefile == null
//                                 ? const CircleAvatar(
//                                     backgroundColor: Colors.black,
//                                     radius: 100,
//                                     // child: Image.asset(getimagePath),
//                                   )
//                                 : CircleAvatar(
//                                     backgroundColor: Colors.black,
//                                     radius: 100,
//                                     backgroundImage: FileImage(
//                                       File(pickeimagefile!.path!),
//                                     ),
//                                   ),
//                           ),
//                           SizedBox(height: 30.h),
//                           Container(
//                             width: 250,
//                             decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.red.withOpacity(0.4),
//                                   blurRadius: 8,
//                                   spreadRadius: 2,
//                                   offset: const Offset(4, 4),
//                                 ),
//                               ],
//                               gradient: const LinearGradient(
//                                   colors: [Colors.red, Colors.red],
//                                   begin: Alignment.centerLeft,
//                                   end: Alignment.centerRight),
//                               borderRadius: const BorderRadius.all(
//                                 Radius.circular(22),
//                               ),
//                             ),
//                             child: TextButton.icon(
//                                 onPressed: () async {
//                                   await selectGalleryOffer();
//                                 },
//                                 icon: const Icon(
//                                   Icons.image,
//                                   color: Colors.white,
//                                 ),
//                                 label: const Text(
//                                   'Open Gallery',
//                                   style: TextStyle(color: Colors.white),
//                                 )),
//                           ),
//                           const SizedBox(height: 50),
//                           Container(
//                             width: 300,
//                             decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.green.withOpacity(0.4),
//                                   blurRadius: 8,
//                                   spreadRadius: 2,
//                                   offset: const Offset(4, 4),
//                                 ),
//                               ],
//                               gradient: const LinearGradient(
//                                   colors: [Colors.green, Colors.green],
//                                   begin: Alignment.centerLeft,
//                                   end: Alignment.centerRight),
//                               borderRadius: const BorderRadius.all(
//                                 Radius.circular(22),
//                               ),
//                             ),
//                             child: TextButton.icon(
//                                 onPressed: () async {
//                                   buildProgress();
//                                   await uploadFileOffer();

//                                   setState(() {});
//                                   // await imageController.uploadImagetoFireBase();
//                                 },
//                                 icon: const Icon(
//                                   Icons.login,
//                                   color: Colors.white,
//                                 ),
//                                 label: const Text(
//                                   'Proceed to next Page',
//                                   style: TextStyle(color: Colors.white),
//                                 )),
//                           ),
//                           buildProgress()
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }

// //  PlatformFile? pickeimagefile;
// //   UploadTask? uploadTask;
//   Future selectGalleryOffer() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result == null) {
//       return;
//     } else {
//       setState(() {
//         pickeimagefile = result.files.first;
//       });
//     }
//   }

//   Future uploadFileOffer() async {
//     final path = "files/Images/${pickeimagefile!.name}";
//     final file = File(pickeimagefile!.path!);
//     //
//     final ref = FirebaseStorage.instance.ref().child(path);
//     setState(() {
//       uploadTask = ref.putFile(file);
//     });

//     // Get URL?????????????????????????
//     final snapshot = await uploadTask!.whenComplete(() {});
//     final urlDownload = await snapshot.ref.getDownloadURL();
//     // Get.off(AddOfferProducts(imagepath: urlDownload));
//     Get.off(StudentProfleCreation(
//       imagePath: urlDownload,
     
//     ));
//     log("Download Link : $urlDownload");
//     setState(() {
//       uploadTask = null;
//     });
//   }

//   Widget buildProgress() => StreamBuilder<TaskSnapshot>(
//         stream: uploadTask?.snapshotEvents,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final data = snapshot.data!;
//             double progress = data.bytesTransferred / data.totalBytes;
//             return SizedBox(
//               height: 50,
//               child: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   LinearProgressIndicator(
//                     value: progress,
//                     backgroundColor: Colors.grey,
//                     color: Colors.green,
//                   ),
//                   Center(
//                     child: Text(
//                       "${(100 * progress).roundToDouble()}%",
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           } else {
//             return const SizedBox(height: 50);
//           }
//         },
//       );
// }

// ////////////////////////////////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////////////////////////////////////////////////
// ////////////////////////////////
// ////////////////////////////////////
// ///
// class DesignTwooffer extends StatelessWidget {
//   const DesignTwooffer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 500,
//       child: Container(
//         height: 200,
//         width: 200,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: const Color.fromARGB(255, 59, 10, 255).withOpacity(0.7),
//         ),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(
//             sigmaX: 200,
//             sigmaY: 200,
//           ),
//           child: Container(
//             height: 200,
//             width: 200,
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DesignoneOffer extends StatelessWidget {
//   const DesignoneOffer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: -150,
//       left: -100,
//       child: Container(
//         height: 166,
//         width: 166,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.white.withOpacity(0.0),
//         ),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(
//             sigmaX: 200,
//             sigmaY: 200,
//           ),
//           child: Container(
//             height: 200,
//             width: 200,
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//     );
//   }
// }
