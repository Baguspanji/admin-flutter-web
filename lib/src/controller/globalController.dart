import 'dart:async';

import 'package:admin_flutter/src/repository/preference.dart';
import 'package:admin_flutter/src/route/route.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  RxBool template = false.obs;

  void changeTemplate(bool status) => template.value = status;

  void logout() async {
    template.value = false;
    rmvToken();
    Timer(Duration(seconds: 1), () {
      Get.offNamed(routeLogin);
    });
  }

  void onSplash() async {
    await getToken().then((token) {
      if (token != '' && token != null) {
        template.value = true;
        Timer(Duration(seconds: 1), () {
          Get.offNamed(routeDashboard);
        });
      } else {
        template.value = false;
        Timer(Duration(seconds: 1), () {
          Get.offNamed(routeLogin);
        });
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    onSplash();
    super.onInit();
  }
}
