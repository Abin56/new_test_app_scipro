// ignore_for_file: non_constant_identifier_names, duplicate_ignore, empty_catches, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scipro_application/screens/drawer/menu.dart';
import 'package:scipro_application/student_screens/pages/Record_Courses/recorded_courses.dart';

import '../../signin/g_signin.dart';
import '../../student_screens/pages/Live_Courses/live_Courses_list.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 0),
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/SCIPRO.png"),
              ),
            ),
          ),
          const Text(
            "SCI PRO",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "info@scipro.in",
            style: TextStyle(color: Colors.amber[200], fontSize: 12),
          )
        ],
      ),
    );
  }
}

Widget MenuItem(int id, String title, IconData icon, bool selected, onTap) {
  return Material(
    color: const Color.fromARGB(255, 39, 29, 41),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  dashboard,
  favourites,
  setting,
  share,
  feedback,
  contact,
  about,
}

// ignore: non_constant_identifier_names
Widget MyDrawerList(context) {
  void signOut(context) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signOut().then((value) => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Gsignin()),
                (route) => false)
          });
    } catch (e) {}
  }

  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
          );
        });
  }

  var currentPage = DrawerSections.dashboard;
  return Container(
    padding: const EdgeInsets.only(top: 15),
    child: Column(
      // show list  of menu drawer.........................
      children: [
        MenuItem(1, "Recorded Courses", Icons.fiber_smart_record_sharp,
            currentPage == DrawerSections.dashboard ? true : false, () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => RecordedCoursesListScreen()));
        }),
        MenuItem(2, "Live Courses", Icons.live_tv_rounded,
            currentPage == DrawerSections.favourites ? true : false, () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => LiveCoursesListScreen()));
        }),
        MenuItem(3, "Setting", Icons.settings,
            currentPage == DrawerSections.setting ? true : false, () {
          termsAndConditions(context);
        }),
        // MenuItem(4, "Share", Icons.share,
        //     currentPage == DrawerSections.share ? true : false, () async {
        //   // await  Share.share('https://play.google.com/store/apps/details?id=in.brototype.BrotoPlayer');
        // }),
        MenuItem(4, "Contact us", Icons.contact_mail_outlined,
            currentPage == DrawerSections.contact ? true : false, () {
          contactus(context);
        }),
        MenuItem(5, "About", Icons.account_box_outlined,
            currentPage == DrawerSections.about ? true : false, () {
          showAboutDialog(
              context: context,
              applicationIcon: const Image(
                image: AssetImage('assets/images/SCIPRO.png'),
                height: 100,
                width: 100,
              ),
              applicationName: "SCI PRO",
              applicationVersion: '1.0.2',
              children: [
                const Text(
                    'SCI PRO is a Education App created by VECTORWIND-TECHSYSTEMS PRIVATE LIMITED.')
              ]);
        }),
        MenuItem(6, "Logout", Icons.logout,
            currentPage == DrawerSections.dashboard ? true : false, () {
          signOut(context);
        }),
        SizedBox(
          height: 200,
          width: 100,
          child: Stack(children: [
            Positioned(
              left: 5,
              top: 40,
              child: Row(
                children: const [
                  Icon(
                    Icons.adb_outlined,
                    color: Colors.green,
                  ),
                  Text(
                    " Version",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 64,
                left: 44,
                child: Column(
                  children: const [
                    Text(
                      "1.0.2",
                      style: TextStyle(
                          color: Color.fromARGB(156, 255, 255, 255),
                          fontSize: 11.5),
                    ),
                  ],
                ))
          ]),
        )
      ],
    ),
  );
}

Widget emptyDisplay(String section) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No $section Found",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
