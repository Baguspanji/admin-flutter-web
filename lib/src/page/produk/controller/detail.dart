import 'package:admin_flutter/src/model/produkModel.dart';
import 'package:admin_flutter/src/repository/produkApi.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final repository = ProdukApi();

  final produkData = ProdukModel().obs;
  RxString image = ''.obs;
  RxString nama = ''.obs;
  RxString satuan = ''.obs;
  RxString stok = ''.obs;
  RxString harga = '0'.obs;

  void getProdukId() async {
    // loadingWidget();
    try {
      ProdukModel res = await repository.getProdukId(Get.arguments);

      image.value = res.data!.image!;
      nama.value = res.data!.nama!;
      satuan.value = res.data!.satuan!;
      stok.value = res.data!.stok!;
      harga.value = res.data!.harga!;
    } finally {
      // Get.back();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getProdukId();
    super.onInit();
  }
}
