import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}



class _StudentHomeScreenState extends State<StudentHomeScreen> {

  late DatabaseReference database;


  @override
  void initState() {
    super.initState();
    database = FirebaseDatabase.instance as DatabaseReference;
    database = database.ref.child('Video').child('start');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
          children: [
            StreamBuilder(
              stream: database.child("Video").child("start").onValue,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data!.snapshot.value["PULSE"].toString()==1)
                  return CircularProgressIndicator(color: Colors.white);
                // var p = double.parse(snapshot.data!.snapshot.value["PULSE"].toString());
                return GestureDetector(
                  onTap: ()
                  {

                  },
                  child: Container(
                    child:
                    Text(
                        (
                        "Enter classroom"
                        )
                    )
                  ),
                );
              },),
    ]
    )

    );
  }
}
