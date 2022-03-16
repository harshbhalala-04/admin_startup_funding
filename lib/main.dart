// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:admin_startupfunding/admin_login_screen.dart';
import 'package:admin_startupfunding/admin_request_screen.dart';
import 'package:admin_startupfunding/bindings/auth_binding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: AuthBinding(),
        title: 'Admin Startup Funnding',
        theme: ThemeData(
            fontFamily: "Cabin",
            primarySwatch: Colors.indigo,
            primaryColor: const Color.fromRGBO(117, 104, 177, 1)),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AdminRequestScreen();
            } else {
              return AdminLoginScreen();
            }
          },
        ));
  }
}
