import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/student_screens/recorded_sub_course_list.dart';
import '../student_screens/pages/Live_Courses/live_sub_courselist.dart';
import '../widgets/button_Container.dart';

class UserSelectingCourselisting extends StatelessWidget {
  const UserSelectingCourselisting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(RecordedCourseListScreen());
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 200.h,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  'Recorded Courses',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                )),
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(LiveCourseListScreen());
              },
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 200.h,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  'Live Courses',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                )),
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            GestureDetector(
              onTap: () {},
              child: ButtonContainerWidget(
                curving: 30,
                colorindex: 0,
                height: 200.h,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  'Hybrid Courses',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
