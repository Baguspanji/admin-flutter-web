import 'dart:async';
import 'dart:io';

import 'package:admin_flutter/src/model/produkModel.dart';
import 'package:path/path.dart' as path;
import 'dart:convert';

import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/model/produksModel.dart';
import 'package:admin_flutter/src/repository/preference.dart';
import 'package:get/get_connect/connect.dart';

class ProdukApi extends GetConnect {
  final String base = '$globalApi/api';
  // final String base = '$globalApi/api';

  // Get request
  Future getProduk() async {
    String token = '';
    await getToken().then((value) => token = value);

    try {
      var res = await get(
        '$base/produk',
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        return ProduksModel.fromMap(res.body);
      } else if (res.statusCode == 400) {
        return false;
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getProdukId(dynamic id) async {
    String token = '';
    await getToken().then((value) => token = value);

    try {
      var res = await get(
        '$base/produk/$id',
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        return ProdukModel.fromMap(res.body);
      } else if (res.statusCode == 401) {
        return false;
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future postProduk(
    String image,
    dynamic imageInt,
    String nama,
    String satuan,
    String stok,
    String harga,
  ) async {
    String token = '';
    await getToken().then((value) => token = value);

    final form = FormData({
      'image': MultipartFile(imageInt, filename: path.basename(image)),
      'nama': nama,
      'satuan': satuan,
      'stok': stok,
      'harga': harga,
    });
    try {
      var res = await post('$base/produk', form, headers: {
        'Authorization': 'Bearer $token',
      });

      if (res.statusCode == 201) {
        return 'succes';
      } else if (res.statusCode == 401) {
        return 'wrong';
      } else if (res.statusCode == 422) {
        return 'type';
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future putProduk(
    String image,
    dynamic imageInt,
    String nama,
    String satuan,
    String stok,
    String harga,
    int id,
    String imageName,
  ) async {
    String token = '';
    await getToken().then((value) => token = value);

    final form = FormData({
      image == imageName ? '' : 'image':
          MultipartFile(imageInt, filename: path.basename(image)),
      'nama': nama,
      'satuan': satuan,
      'stok': stok,
      'harga': harga,
      '_method': 'PUT',
    });
    try {
      var res = await post('$base/produk/$id', form, headers: {
        'Authorization': 'Bearer $token',
      });

      if (res.statusCode == 201) {
        return 'succes';
      } else if (res.statusCode == 401) {
        return 'wrong';
      } else if (res.statusCode == 422) {
        return 'type';
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  // Delete
  Future delProduk(int id) async {
    String token = '';
    await getToken().then((value) => token = value);

    dynamic body = {'_method': 'DELETE'};

    try {
      var res = await post(
        '$base/produk/$id',
        json.encode(body),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 204) {
        return 'succes';
      } else if (res.statusCode == 404) {
        return 'not_found';
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  // Post request with File
  // Future postCases(List<int> image) {
  //   final form = FormData({
  //     'file': MultipartFile(image, filename: 'avatar.png'),
  //     'otherFile': MultipartFile(image, filename: 'cover.png'),
  //   });
  //   return post('http://youapi/users/upload', form);
  // }

  // GetSocket userMessages() {
  //   return socket('https://yourapi/users/socket');
  // }
}
