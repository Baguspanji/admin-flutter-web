import 'dart:async';

import 'package:admin_flutter/src/route/route.dart';
import 'package:admin_flutter/src/repository/preference.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void onSplash() async {
    await getToken().then((token) {
      if (token != '' && token != null) {
        Timer(Duration(seconds: 2), () {
          Get.offNamed(routeDashboard);
        });
      } else {
        Timer(Duration(seconds: 2), () {
          Get.offNamed(routeLogin);
        });
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    // onSplash();
    super.onInit();
  }
}
