import 'package:admin_flutter/src/helper/inputHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/page/produk/controller/edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProdukPage extends StatelessWidget {
  final con = Get.put(EditProdukController());

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
            'Add Product',
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size.width * 0.4,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          CustomInput(
                            controller: con.namaController,
                            label: 'Product Name',
                            hint: 'Enter Product Name',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          CustomInput(
                            controller: con.satuanController,
                            label: 'Unit',
                            hint: 'Enter Product Unit',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          CustomInput(
                            controller: con.stokController,
                            label: 'Qty',
                            hint: 'Enter Product Qty',
                            type: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          CustomInput(
                            controller: con.hargaController,
                            label: 'Price',
                            hint: 'Enter Product Price',
                            type: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        width: size.width * 0.2,
                        height: size.height * 0.06,
                        child: ElevatedButton(
                          onPressed: () => con.onUpdate(),
                          child: CustomText(
                            'Update',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.4,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.3,
                      child: Obx(
                        () => con.image.value == ''
                            ? Image.asset('images/no-image.png')
                            : Image.network(con.image.value),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: size.width * 0.1,
                      height: size.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () => con.onImage(),
                        child: CustomText(
                          'Change Image',
                          color: Colors.white,
                        ),
                      ),
                    )
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
