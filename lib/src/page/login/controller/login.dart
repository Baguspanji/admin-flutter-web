import 'dart:async';

import 'package:admin_flutter/src/controller/globalController.dart';
import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/model/loginModel.dart';
import 'package:admin_flutter/src/repository/api.dart';
import 'package:admin_flutter/src/route/route.dart';
import 'package:admin_flutter/src/repository/preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final global = Get.put(GlobalController());

  final repository = Api();

  RxString errorText = ''.obs;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  onLogin() async {
    if (emailcontroller.text.isEmpty || passwordcontroller.text.isEmpty) {
      errorText.value = 'email/password is not empty';
    }

    if (errorText.value != '') {
      Get.defaultDialog(
        title: 'Attention',
        titleStyle: TextStyle(fontWeight: FontWeight.bold),
        content: Column(
          children: [
            CustomText('Input is not valid'),
            CustomText('${errorText.value}'),
          ],
        ),
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
      return;
    }

    loadingWidget();

    var res = await repository.postLogin(
        {'email': emailcontroller.text, 'password': passwordcontroller.text});
    // print(res.data!.accessToken);
    if (res == 'wrong') {
      Get.back();
      Timer(Duration(seconds: 1), () {
        customAlert('Username or Password is wrong!');
      });
    } else if (res == 'type') {
      Get.back();
      Timer(Duration(seconds: 1), () {
        customAlert('Username or Password is not valid!');
      });
    } else {
      var user = res as LoginModel;
      if (user.data!.user!.role != 'admin') {
        Get.back();
        Timer(Duration(seconds: 1), () {
          customAlert('User is not registered!');
        });
      } else {
        await setToken(res.data!.accessToken!);
        await setName(res.data!.user!.name!);
        Get.back();
        Timer(Duration(seconds: 2), () {
          global.changeTemplate(true);
        });
        Timer(Duration(seconds: 1), () {
          Get.offNamed(routeDashboard);
        });
      }
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    emailcontroller.clear();
    passwordcontroller.clear();
    super.onClose();
  }
}
