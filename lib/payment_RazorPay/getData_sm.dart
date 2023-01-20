import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scipro_application/model/studyMaterials.dart/s_materials_model.dart';

Future<void> getData() async {
  final currentuser = FirebaseAuth.instance.currentUser!.uid;
  // Get docs from collection reference
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("StudyMaterials").get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  for (var element in allData) {
    await FirebaseFirestore.instance
        .collection("Student_Material_AfterPayment")
        .doc(currentuser)
        .collection("StudyMaterials")
        .doc()
        .set(element as Map<String, dynamic>);
  }

  log(allData.toString());
}


// class PayedStudyMaterialsToFireBase {
//   final currentUser = FirebaseAuth.instance.currentUser!.uid;
//   Future payedStudyMaterialsController(StudyMaterialModel model) async {
//     var x = await FirebaseFirestore.instance
//         .collection("StudyMaterials")
//         .doc()
//         .get();
//     var y = x.data();
//     var z = ListSmaterial.fromMap(y!);
//     ListSmaterial list =
//         ListSmaterial(listofStudyMaterials: z.listofStudyMaterials);

//     list.listofStudyMaterials.add(model);
//     FirebaseFirestore.instance
//         .collection("StudetMaterial_Afterpayment")
//         .doc(currentUser)
//         .set(list.toMap());
//   }
// }
// Stream<List<StudyMaterialModel>> getOwnerOrders() {
//     final stream = FirebaseFirestore.instance
//         .collection('orders')
//         .where('ownerId', isEqualTo: _auth.currentUser!.uid)
//         .orderBy('orderDate', descending: true)
//         .snapshots()
//         .map(
//           (snapshot) => snapshot.docs
//               .map(
//                 (doc) => OrdersModel.fromMap(
//                   doc.data(),
//                 ),
//               )
//               .toList(),
//         );

//     return stream;
//   }
