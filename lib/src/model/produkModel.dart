// To parse this JSON data, do
//
//     final produkModel = produkModelFromMap(jsonString);

import 'dart:convert';

class ProdukModel {
  ProdukModel({
    this.data,
  });

  Data? data;

  factory ProdukModel.fromJson(String str) =>
      ProdukModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProdukModel.fromMap(Map<String, dynamic> json) => ProdukModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.id,
    this.nama,
    this.satuan,
    this.harga,
    this.stok,
    this.image,
    this.tanggal,
  });

  int? id;
  String? nama;
  String? satuan;
  String? harga;
  String? stok;
  String? image;
  DateTime? tanggal;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        satuan: json["satuan"],
        harga: json["harga"],
        stok: json["stok"],
        image: json["image"],
        tanggal: DateTime.parse(json["tanggal"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "satuan": satuan,
        "harga": harga,
        "stok": stok,
        "image": image,
        "tanggal": tanggal!.toIso8601String(),
      };
}
