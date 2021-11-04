import 'package:admin_flutter/src/controller/globalController.dart';
import 'package:flutter/material.dart';
import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/page/widget/sidebar.dart';
import 'package:get/get.dart';

class MyTemplate extends StatelessWidget {
  MyTemplate({Key? key, this.child}) : super(key: key);
  final Widget? child;

  final global = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          'AdminFlutter',
          color: Colors.blue,
          weight: FontWeight.bold,
          size: 26.0,
          center: false,
        ),
        leading: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FlutterLogo(),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(),
              ),
              child: IconButton(
                onPressed: () {
                  global.logout();
                },
                icon: Image.asset(
                  'images/logout_icon.png',
                  scale: 0.5,
                ),
              ),
            ),
          ),
        ],
        elevation: 8.0,
      ),
      body: SidebarPage(child: child),
      backgroundColor: clr.primary,
    );
  }
}

class MySecondTemplate extends StatelessWidget {
  const MySecondTemplate({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: clr.primary,
    );
  }
}
