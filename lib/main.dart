import 'package:admin_flutter/src/app.dart';
import 'package:admin_flutter/src/controller/globalController.dart';
import 'package:admin_flutter/src/route/route.dart';
import 'package:admin_flutter/src/route/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final global = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Flutter',
      theme: ThemeData(
          fontFamily: 'Abel',
          primarySwatch: Colors.blue,
          backgroundColor: Colors.blueGrey[50],
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
            ),
          )),
      builder: (_, child) => Obx(() {
        if (global.template.value) {
          return MyTemplate(child: child);
        } else {
          return MySecondTemplate(child: child);
        }
      }),
      initialRoute: routeSplash,
      getPages: myGetPages,
    );
  }
}
