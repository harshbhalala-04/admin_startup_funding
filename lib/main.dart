// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:admin_startupfunding/admin_login_screen.dart';
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
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: "Cabin",
            primarySwatch: Colors.indigo,
            primaryColor: const Color.fromRGBO(117, 104, 177, 1)),
        home: AdminLoginScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                width: 230,
                child: ElevatedButton(
                  child: Text(
                    'Log in as Admin',
                    style: TextStyle(fontFamily: "Cabin", fontSize: 18),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
