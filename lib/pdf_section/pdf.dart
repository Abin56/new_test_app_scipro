// // ignore_for_file: must_be_immutable, sort_child_properties_last

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'dart:typed_data';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:scipro/screens/home_screen.dart';

// class PDFSectionScreen extends StatelessWidget {
//   String customerName;
//   String purchasingPlan;
//   String price;
//   String email;

//   PDFSectionScreen(
//       {required this.customerName,
//       required this.email,
//       required this.purchasingPlan,
//       required this.price,
//       super.key});

//   @override
//   Widget build(BuildContext context) {
//     // paymentSucessFull(context);
//     // getHomePage(context);
//     log(customerName);
//     log(purchasingPlan);
//     log(price);
//     log(email);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Printing Demo'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.print),
//         tooltip: 'Print Document',
//         onPressed: () {
//           Printing.layoutPdf(
//             onLayout: (PdfPageFormat format) {
//               return buildPdf(format);
//             },
//           );
//         },
//       ),
//       body: const Center(
//         child: Text('Click on the print button below'),
//       ),
//     );
//   }

//   Future<Uint8List> buildPdf(PdfPageFormat format) async {
//     // Create the Pdf document
//     final pw.Document doc = pw.Document();
//     final netImage = await networkImage(
//         'https://firebasestorage.googleapis.com/v0/b/lepton-scipro-91560.appspot.com/o/LOGO%2027-10-2022.png?alt=media&token=001a32fa-0297-4067-8572-91a985421276');

//     // Add one page with centered text "Hello World"
//     doc.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(children: [
//             pw.Row(children: [
//               pw.Column(children: [
//                 pw.Container(
//                   child: pw.Image(netImage, height: 180, width: 180),
//                 ),
//                 pw.Container(
//                   child: pw.Text("Vectorwind Tech Systems Pvt,Ltd,\n"
//                       "Door.No. 4/461,2nd floor,suite#151\n"
//                       "valamkottil towers,\n"
//                       "judgemukku,Thrikkakkara p.o,\n"
//                       "kochi-682021,kerala,India"),
//                 ),
//                 pw.SizedBox(height: 10),
//                 pw.Container(
//                     child: (pw.Text("TO \n "
//                         "Address of recipients"))),
//               ]),
//               //  pw.Expanded(child: Container(child: ,))
//               pw.Spacer(),
//               pw.Column(children: [
//                 pw.Container(
//                   child: (pw.Text('INVOICE')),
//                 ),
//                 pw.SizedBox(height: 15),
//                 pw.Container(child: pw.Text("INVOICE NUMBER")),
//                 pw.SizedBox(height: 15),
//                 pw.Container(child: pw.Text("PO NUMBER:")),
//               ]),
//             ]),
//             pw.SizedBox(height: 100),
//             pw.Row(children: [
//               pw.Column(children: [
//                 pw.Row(children: [
//                   pw.Container(
//                     child: pw.Text("PO NUMBER:"),
//                   ),
//                   pw.Container(
//                     child: pw.Text("heydh \n"
//                         ""),
//                   ),
//                   pw.Container(
//                     child: pw.Text("Tktgj \n"
//                         ""),
//                   ),
//                   pw.Container(
//                     child: pw.Text("Awrey \n"
//                         " "),
//                   )
//                 ]),
//               ])
//             ])
//           ]);
//         },
//       ),
//     );

//     // Build and return the final Pdf file data
//     return await doc.save();
//   }
// }

// // paymentSucessFull(context) {
// //   SizedBox(
// //       height: double.infinity,
// //       width: double.infinity,
// //       child: LottieBuilder.asset('assets/images/101253-successful.json'));
// // }

// // getHomePage(context) async {
// //   log("calling home page");
// //   await Future.delayed(const Duration(seconds: 5));
// //   Get.offAll(const HomeScreen());
// // }