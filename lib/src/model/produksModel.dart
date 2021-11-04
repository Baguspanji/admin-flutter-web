// To parse this JSON data, do
//
//     final produkModel = produkModelFromMap(jsonString);

import 'dart:convert';

class ProduksModel {
  ProduksModel({
    this.data,
  });

  List<Datum>? data;

  factory ProduksModel.fromJson(String str) =>
      ProduksModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProduksModel.fromMap(Map<String, dynamic> json) => ProduksModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
