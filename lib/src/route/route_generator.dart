import 'package:admin_flutter/src/page/dashboard/dashboard.dart';
import 'package:admin_flutter/src/page/login/login.dart';
import 'package:admin_flutter/src/page/pesan/pesan.dart';
import 'package:admin_flutter/src/page/produk/add.dart';
import 'package:admin_flutter/src/page/produk/detail.dart';
import 'package:admin_flutter/src/page/produk/edit.dart';
import 'package:admin_flutter/src/page/produk/produk.dart';
import 'package:admin_flutter/src/page/splash/splash.dart';
import 'package:admin_flutter/src/page/user/user.dart';
import 'package:admin_flutter/src/route/route.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? myGetPages = [
  GetPage(
    name: routeDashboard,
    page: () => DashboardPage(),
  ),
  GetPage(
    name: routeUsers,
    page: () => UserPage(),
  ),
  GetPage(
    name: routeOrder,
    page: () => PesanPage(),
  ),
  GetPage(
    name: routeProduct,
    page: () => ProdukPage(),
  ),
  GetPage(
    name: routeAddProduct,
    page: () => AddProdukPage(),
  ),
  GetPage(
    name: routeEditProduct,
    page: () => EditProdukPage(),
  ),
  GetPage(
    name: routeDetailProduct,
    page: () => DetailProdukPage(),
  ),
  GetPage(
    name: routeSplash,
    page: () => SplashPage(),
  ),
  GetPage(
    name: routeLogin,
    page: () => LoginPage(),
  ),
];
