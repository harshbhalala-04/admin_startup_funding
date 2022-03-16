// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomUserCard extends StatelessWidget {
  final String startupLogo;
  final String startupName;
  final String startupCEO;

  CustomUserCard(
      {required this.startupLogo,
      required this.startupName,
      required this.startupCEO});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 90,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  startupLogo,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    startupName,
                    style: TextStyle(
                      fontFamily: "Cabin",
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    startupCEO,
                    style: TextStyle(
                      fontFamily: "Cabin",
                      fontSize: 16,
                      color: Colors.grey
                    ),
                  ),
                ],
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
