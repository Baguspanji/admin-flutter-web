import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/helper/inputHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/page/produk/controller/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailProdukPage extends StatelessWidget {
  final con = Get.put(DetailController());

  final rp = new NumberFormat("#,##0", "en_US");

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
            'Detail Product',
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.3,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                  height: size.height * 0.3,
                  child: Obx(
                    () => con.image.value == ''
                        ? Image.asset('images/no-image.png')
                        : Image.network('$globalApi${con.image.value}'),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: size.width * 0.4,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Obx(
                  () => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            CustomText('Product Name : '),
                            CustomText(con.nama.value),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            CustomText('Satuan : '),
                            CustomText(con.satuan.value),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            CustomText('Stok : '),
                            CustomText(con.stok.value),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            CustomText('Harga : '),
                            CustomText(
                                'Rp. ${rp.format(int.parse(con.harga.value))}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
