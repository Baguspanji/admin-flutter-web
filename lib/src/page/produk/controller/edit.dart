import 'dart:async';

import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/model/produkModel.dart';
import 'package:admin_flutter/src/page/produk/controller/produk.dart';
import 'package:admin_flutter/src/repository/produkApi.dart';
import 'package:admin_flutter/src/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProdukController extends GetxController {
  final repository = ProdukApi();

  final produk = Get.put(ProdukController());

  final ImagePicker _picker = ImagePicker();

  final produkData = ProdukModel().obs;

  final namaController = TextEditingController();
  final satuanController = TextEditingController();
  final stokController = TextEditingController();
  final hargaController = TextEditingController();

  RxString image = ''.obs;
  RxString image2 = ''.obs;
  List<int> imageInt = [0].obs;
  RxInt id = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProdukId();
    super.onInit();
  }

  void getProdukId() async {
    // loadingWidget();
    try {
      ProdukModel res = await repository.getProdukId(Get.arguments);

      id.value = Get.arguments;
      produkData.value = res;
      namaController.text = res.data!.nama!;
      satuanController.text = res.data!.satuan!;
      stokController.text = res.data!.stok!;
      hargaController.text = res.data!.harga!;
      image.value = '$globalApi${res.data!.image!}';
      image2.value = '$globalApi${res.data!.image!}';
    } finally {
      // Get.back();
    }
  }

  void onUpdate() async {
    if (namaController.text.isEmpty ||
        satuanController.text.isEmpty ||
        stokController.text.isEmpty ||
        hargaController.text.isEmpty) {
      Get.defaultDialog(
        title: 'Attention',
        titleStyle: TextStyle(fontWeight: FontWeight.bold),
        content: CustomText('Input is not empty!'),
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

    var res = await repository.putProduk(
      image.value,
      imageInt,
      namaController.text,
      satuanController.text,
      stokController.text,
      hargaController.text,
      id.value,
      image2.value,
    );

    if (res == 'wrong') {
      Get.back();
      Timer(Duration(seconds: 1), () {
        customAlert('Input is wrong!');
      });
    } else if (res == 'type') {
      Get.back();
      Timer(Duration(seconds: 1), () {
        customAlert('Input is not valid!');
      });
    } else {
      Get.back();
      produk.getProduk();
      Timer(Duration(seconds: 1), () {
        Get.offNamed(routeProduct);
      });
    }
  }

  void onImage() async {
    final XFile? _imagePick =
        await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      image.value = _imagePick!.path;
      imageInt = await _imagePick.readAsBytes();
    }
  }
}
