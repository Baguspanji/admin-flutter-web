import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/page/splash/controller/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  // final con = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 120),
            SizedBox(height: 10),
            CustomText(
              'Admin Flutter',
              weight: FontWeight.bold,
              color: Colors.blueAccent,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}
