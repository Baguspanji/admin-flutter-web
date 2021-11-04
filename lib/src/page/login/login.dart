import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/helper/inputHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/page/login/controller/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: FlutterLogo(size: 120),
            ),
            SizedBox(height: 10),
            CustomText(
              'Admin Flutter',
              weight: FontWeight.bold,
              color: Colors.blueAccent,
              size: 32,
            ),
            SizedBox(height: 10),
            Container(
              width: size.width * 0.4,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: clr.shadow,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Column(
                      children: [
                        CustomInput(
                          controller: con.emailcontroller,
                          label: 'Email',
                          hint: 'Enter your email',
                          type: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Column(
                      children: [
                        CustomInput(
                          controller: con.passwordcontroller,
                          label: 'Password',
                          hint: 'Enter your password',
                          hidden: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        con.onLogin();
                      },
                      child: CustomText(
                        'Login',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
