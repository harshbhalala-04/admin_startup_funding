// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:admin_startupfunding/model/startup_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomUserCard extends StatelessWidget {
  final String uid;
  final String name;
  CustomUserCard({required this.uid, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: ListTile(
              leading: Image(
                image: AssetImage("assets/appbar_logo.png"),
              ),
              title: Text(
                name,
                style: TextStyle(
                  fontFamily: "Cabin",
                  fontSize: 12,
                ),
              ),
              trailing: TextButton(
                  child: Icon(
                    Icons.arrow_right,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  onPressed: () {}),
            ),
          ),
        ),
      ),
    );
  }
}
