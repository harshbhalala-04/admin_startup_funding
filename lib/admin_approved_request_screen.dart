// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_startupfunding/homescreen_controller.dart';
import 'package:admin_startupfunding/startup_detail_screen.dart';
import 'package:admin_startupfunding/widgets/custom_user_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:admin_startupfunding/model/startup_model.dart';
import 'package:get/get.dart';

class AdminApprovedRequestScreen extends StatefulWidget {
  const AdminApprovedRequestScreen({Key? key}) : super(key: key);

  @override
  State<AdminApprovedRequestScreen> createState() =>
      _AdminApprovedRequestScreenState();
}

class _AdminApprovedRequestScreenState
    extends State<AdminApprovedRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 25),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            child: TextFormField(
              onChanged: (val) {
                searchUser(val);
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 18),
                hintText: 'Search',
                suffixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              Get.find<HomeScreenController>().foundApprovedStartups.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(StartupDetailScreen(
                  startup:
                      Get.find<HomeScreenController>().foundApprovedStartups[index],
                  fromApproved: true,
                ));
              },
              child: CustomUserCard(
                  startupCEO: Get.find<HomeScreenController>()
                      .foundApprovedStartups[index]
                      .userName!,
                  startupLogo: Get.find<HomeScreenController>()
                      .foundApprovedStartups[index]
                      .startupLogoUrl!,
                  startupName: Get.find<HomeScreenController>()
                      .foundApprovedStartups[index]
                      .startupName!),
            );
          },
        ),
      ]),
    );
  }

  void searchUser(String query) {
    if (query.isEmpty) {
      setState(() {
        Get.find<HomeScreenController>().foundApprovedStartups =
            Get.find<HomeScreenController>().approvedStartups;
      });
    } else {
      final listStartups =
          Get.find<HomeScreenController>().approvedStartups.where((startups) {
        final startupNameLower = startups.startupName!.toLowerCase();
        final userNameLower = startups.userName!.toLowerCase();
        final searchLower = query.toLowerCase();

        return userNameLower.contains(searchLower) ||
            startupNameLower.contains(searchLower);
      }).toList();

      setState(() {
        Get.find<HomeScreenController>().foundApprovedStartups = listStartups;
      });
    }
  }
}
