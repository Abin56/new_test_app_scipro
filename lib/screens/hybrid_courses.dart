import 'package:flutter/material.dart';

class HybridCourses extends StatefulWidget {
  const HybridCourses({Key? key}) : super(key: key);

  @override
  State<HybridCourses> createState() => _HybridCoursesState();
}

class _HybridCoursesState extends State<HybridCourses> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Coming Soon............',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
