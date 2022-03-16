// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_startupfunding/admin_new_request_screen.dart';
import 'package:admin_startupfunding/admin_approved_request_screen.dart';
import 'package:admin_startupfunding/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminRequestScreen extends StatelessWidget {
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Startup Funding',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "Cabin",
            ),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage("assets/appbar_logo.png"),
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Obx(() => homeScreenController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    toolbarHeight: 0,
                    bottom: TabBar(
                      indicatorColor: Theme.of(context).primaryColor,
                      labelColor: Theme.of(context).primaryColor,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Text("New Requests"),
                        ),
                        Tab(
                          child: Text("Approved Requests"),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      AdminNewRequestScreen(),
                      AdminApprovedRequestScreen(),
                    ],
                  ),
                ))));
  }
}
