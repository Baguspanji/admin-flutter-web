import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final String globalApi = 'https://maisyaroh.com/merchant';
// final String GlobalApi = 'http://localhost:8000';

class Helper {
  final double sized = 20.0;
}

final helper = Helper();

class Color {
  final primary = Colors.blueGrey[50];
  final dasar = Colors.blueGrey[200];
  final shadow = Colors.black12;
}

final clr = Color();

void customAlert(alert) {
  Get.defaultDialog(
    title: 'Attention',
    titleStyle: TextStyle(fontWeight: FontWeight.bold),
    content: CustomText(alert),
    cancel: Container(
      width: 60,
      height: 30,
      child: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: CustomText(
          'OK',
          color: Colors.white,
          size: 12,
        ),
      ),
    ),
  );
}

void loadingWidget() {
  Get.dialog(Center(
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CircularProgressIndicator(),
    ),
  ));
}
