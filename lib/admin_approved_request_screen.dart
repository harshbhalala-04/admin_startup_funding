// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_startupfunding/widgets/custom_user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminApprovedRequestScreen extends StatelessWidget {
  const AdminApprovedRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(
                'Approved Accounts ',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                  '('
                  // Get.find<StartupRequestController>()
                  //     .inviteSentList
                  //     .length
                  //     .toString() +
                  ')',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 25),
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
          // itemCount: Get.find<StartupRequestController>().inviteSentList.length,
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(onTap: () {}, child: CustomUserCard());
          },
        ),
      ]),
    );
  }
}
