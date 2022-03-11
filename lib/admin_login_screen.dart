// ignore_for_file: prefer_const_constructors
import 'package:admin_startupfunding/admin_request_screen.dart';
import 'package:admin_startupfunding/controllers/admin_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminLoginScreen extends GetWidget<AdminAuthController> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String title = "Admin";
  final authController = Get.put(AdminAuthController());
  @override
  Widget build(BuildContext context) {
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
                              controller: _emailController,
                            ),
                            TextFormField(
                              obscureText: controller.isPassVisible.value,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: InkWell(
                                    onTap: () {
                                      controller.toggolePasswordVisibility();
                                    },
                                    child: Icon(Icons.visibility)),
                              ),
                              controller: _passwordController,
                            ),

                            // Obx(() => controller.isLogin.value
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    // controller.resetPass.value =
                                    //     !controller.resetPass.value;
                                    // controller.isLogin.value = false;
                                  },
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            ),

                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.login(_emailController.text.trim(),
                                      _passwordController.text.trim(), title);
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    )),
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
