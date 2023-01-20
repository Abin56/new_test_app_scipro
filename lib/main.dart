// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:scipro_application/bloc/auth_cubit.dart';
import 'package:scipro_application/firebase_options.dart';
import 'package:scipro_application/payment_RazorPay/getData_sm.dart';
import 'package:scipro_application/signin/g_signin.dart';
import 'package:scipro_application/splash_screen/on_boarding.dart';
import 'package:scipro_application/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/auth_state.dart';
import 'model/hive/profile_model.dart';

bool? seenonboard;
late Box<DBStudentList> studentdataDB;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DBStudentListAdapter().typeId)) {
    Hive.registerAdapter(DBStudentListAdapter());
  }
  studentdataDB = await Hive.openBox<DBStudentList>('studentlist');
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenonboard = pref.getBool('seenonboard') ?? false;

  runApp(const MyApp());
  disableCapture();
  // PayedStudyMaterialsToFireBase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384.0, 805.3333333333334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: GetMaterialApp(
            title: "Pixcles",
            home: BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (oldstate, newstate) {
                return oldstate is AuthInitialState;
              },
              builder: (context, state) {
                if (state is AuthLoggedInState) {
                  return Splashscreen();
                } else if (state is AuthLoggedOutState) {
                  return const Gsignin();
                } else {
                  return const Onboardingpage();
                }
              },
            ),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}

disableCapture() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_KEEP_SCREEN_ON);
}
