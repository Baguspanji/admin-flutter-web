import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/model/produksModel.dart';
import 'package:admin_flutter/src/repository/produkApi.dart';
import 'package:admin_flutter/src/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProdukController extends GetxController {
  final repository = ProdukApi();

  final listProduk = ProduksModel(data: []).obs;
  final searchProduk = ProduksModel(data: []).obs;
  RxBool loading = true.obs;

  final searchController = TextEditingController();

  void onSearch(String value) {
    ProduksModel produk = ProduksModel(data: []);

    var data = listProduk.value.data!.where(
      (e) => e.nama!.toLowerCase().contains(value.toLowerCase()),
    );

    if (data.isNotEmpty) {
      produk.data!.addAll(data);
    }
    searchProduk.value = produk;
  }

  void getProduk() async {
    try {
      ProduksModel res = await repository.getProduk();

      listProduk.value = res;
    } finally {
      loading.value = false;
    }
  }

  void delProduk(int id) async {
    await Get.defaultDialog(
      title: 'Alert',
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      content: CustomText('Are you sure?'),
      cancel: Container(
        width: 60,
        height: 30,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent),
          ),
          onPressed: () {
            Get.back();
          },
          child: CustomText(
            'No',
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      confirm: Container(
        width: 60,
        height: 30,
        child: ElevatedButton(
          onPressed: () async {
            loadingWidget();
            try {
              await repository.delProduk(id);
            } finally {
              Get.back();
              getProduk();
            }
          },
          child: CustomText(
            'Yes',
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }

  void onEdit(int id) {
    Get.toNamed(routeEditProduct, arguments: id);
  }

  void onDetail(int id) {
    Get.toNamed(routeDetailProduct, arguments: id);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getProduk();
    super.onInit();
  }
}
