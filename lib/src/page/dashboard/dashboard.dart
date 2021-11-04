import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/page/dashboard/controller/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboardWidget.dart';

class DashboardPage extends StatelessWidget {
  final con = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomText(
            'Dashboard',
            size: 30,
            weight: FontWeight.w500,
            center: false,
          ),
          Container(
            width: size.width * 0.14,
            child: new Divider(),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    DashItem(
                      size: size,
                      count: '27',
                      title: 'Products',
                      icon: Icons.card_travel,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    DashItem(
                      size: size,
                      count: '2',
                      title: 'Orders',
                      icon: Icons.sell,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    DashItem(
                      size: size,
                      count: '4',
                      title: 'Users',
                      icon: Icons.person,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
