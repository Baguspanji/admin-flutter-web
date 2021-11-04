import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/helper/inputHelper.dart';
import 'package:admin_flutter/src/helper/textHelper.dart';
import 'package:admin_flutter/src/page/produk/controller/produk.dart';
import 'package:admin_flutter/src/route/route.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProdukPage extends StatelessWidget {
  ProdukPage({Key? key}) : super(key: key);

  final con = Get.put(ProdukController());
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    'List Product',
                    size: 30,
                    weight: FontWeight.w500,
                    center: false,
                  ),
                  Container(
                    width: size.width * 0.14,
                    child: new Divider(),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: size.width * 0.2,
                height: size.height * 0.06,
                child: CustomInput(
                  controller: con.searchController,
                  label: 'Search',
                  hint: 'Search Product Name',
                  onChange: (value) {
                    con.onSearch(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(routeAddProduct),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 6.0,
                    ),
                    child: CustomText(
                      'Add Product',
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Obx(() {
                if (con.loading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (con.listProduk.value.data!.length != 0) {
                    var produk = con.listProduk.value.data!;
                    if (con.searchProduk.value.data!.length != 0) {
                      produk = con.searchProduk.value.data!;
                    }
                    return DataTable2(
                      border: TableBorder.all(width: 1, color: clr.dasar!),
                      columnSpacing: 12,
                      horizontalMargin: 8,
                      minWidth: 20,
                      headingRowHeight: 50,
                      dataRowHeight: 100,
                      columns: [
                        DataColumn2(
                          label: CustomText(
                            '#',
                            weight: FontWeight.w700,
                            size: 18,
                          ),
                          size: ColumnSize.S,
                        ),
                        DataColumn(
                          label: CustomText(
                            'Image',
                            weight: FontWeight.w700,
                            size: 18,
                          ),
                        ),
                        DataColumn(
                          label: CustomText(
                            'Product Name',
                            weight: FontWeight.w700,
                            size: 18,
                          ),
                        ),
                        DataColumn(
                          label: CustomText(
                            'Unit',
                            weight: FontWeight.w700,
                            size: 18,
                          ),
                        ),
                        DataColumn(
                          label: CustomText(
                            'Qty',
                            weight: FontWeight.w700,
                            size: 18,
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: CustomText(
                            'Price',
                            weight: FontWeight.w700,
                            size: 18,
                          ),
                          numeric: true,
                        ),
                        DataColumn(
                          label: CustomText(
                            'Action',
                            weight: FontWeight.w700,
                            size: 18,
                          ),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        produk.length,
                        (i) => DataRow(
                          cells: [
                            DataCell(CustomText('${i + 1}', size: 26)),
                            DataCell(
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                child: produk[i].image == ''
                                    ? Image.asset('images/no-image.png')
                                    : Image.network(
                                        '${globalApi}${produk[i].image!}',
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            DataCell(CustomText('${produk[i].nama}', size: 26)),
                            DataCell(
                                CustomText('${produk[i].satuan}', size: 26)),
                            DataCell(CustomText('${produk[i].stok}', size: 26)),
                            DataCell(
                              CustomText(
                                  'Rp. ${rp.format(int.parse(produk[i].harga!))}',
                                  size: 26),
                            ),
                            DataCell(
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () =>
                                        con.onDetail(produk[i].id!),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Icon(Icons.card_travel),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => con.onEdit(produk[i].id!),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orangeAccent),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Icon(Icons.edit),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () =>
                                        con.delProduk(produk[i].id!),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.redAccent),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Icon(Icons.delete),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CustomText('Data Kosong', size: 32),
                    );
                  }
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
