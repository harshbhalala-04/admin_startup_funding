// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:admin_startupfunding/admin_request_screen.dart';
import 'package:admin_startupfunding/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginScreen extends GetWidget<AuthController> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("This is passsword value ${controller.isPassVisible.value}");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "Admin",
          style: TextStyle(color: Colors.white, fontSize: 36),
        ),
        leading: Container(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/auth_bg.jfif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 44),
          child: Center(
            child: ListView(children: [
              Column(children: [
                SizedBox(height: 100),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              enableSuggestions: false,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                              ),
                              controller: emailController,
                            ),
                            Obx(() =>  TextFormField(
                              obscureText: controller.isPassVisible.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: InkWell(
                                    onTap: () {
                                      controller.toggolePasswordVisibility();
                                    },
                                    child: Icon(Icons.visibility)),
                              ),
                              controller: passwordController,
                            ),),
                            SizedBox(
                              height: 12,
                            ),
                            Obx(
                              () => controller.isLoading.value
                                  ? CircularProgressIndicator()
                                  : Container(
                                      width: 150,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller.login(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                          );
                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            )),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
