// // ignore_for_file: sort_child_properties_last

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import '../screens/live_courses.dart';
// import '../screens/recorded_courses.dart';
// import '../signin/g_signin.dart';
// // ignore: use_key_in_widget_constructors
// class NavDrawer extends StatelessWidget {
//   final auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             child: Text(""),
//             decoration: BoxDecoration(
//                 color: Colors.blue,
//                 image: DecorationImage(
//                     fit: BoxFit.fill, image: AssetImage('assets/images/'))),
//           ),
//           ListTile(
//             leading: const Icon(Icons.input),
//             title: const Text('Welcome'),
//             onTap: () => {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const RecordedCourses()),
//               ),
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.verified_user),
//             title: const Text('Profile'),
//             onTap: () => {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const LiveCourses()),
//               ),
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
//           ListTile(
//             leading: const Icon(Icons.border_color),
//             title: const Text('Feedback'),
//             onTap: () => {Navigator.of(context).pop()},
//           ),
//           ListTile(
//               leading: const Icon(Icons.exit_to_app),
//               title: const Text('Logout'),
//               onTap: () => {
//                     signOut(context),
//                   }),
//         ],
//       ),
//     );
//   }

//   void signOut(context) async {
//     try {
//       await auth.signOut().then((value) => {
//             Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Gsignin()),
//                 (route) => false)
//           });
//     } catch (e) {
//       errorBox(context, e);
//     }
//   }

//   void errorBox(context, e) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text("Error"),
//             content: Text(e.toString()),
//           );
//         });
//   }
// }
