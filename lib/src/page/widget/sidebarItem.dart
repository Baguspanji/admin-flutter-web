import 'package:admin_flutter/src/route/route.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<CollapsibleItem> get generateItems {
  return [
    CollapsibleItem(
      text: 'Dashboard',
      icon: Icons.assessment,
      onPressed: () => Get.toNamed(routeDashboard),
      isSelected: true,
    ),
    CollapsibleItem(
      text: 'Product',
      icon: Icons.card_travel,
      onPressed: () => Get.toNamed(routeProduct),
    ),
    CollapsibleItem(
      text: 'Orders',
      icon: Icons.sell,
      onPressed: () => Get.toNamed(routeOrder),
    ),
    CollapsibleItem(
      text: 'Users',
      icon: Icons.person,
      onPressed: () => Get.toNamed(routeUsers),
    ),
  ];
}
