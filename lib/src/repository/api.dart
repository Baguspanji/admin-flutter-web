import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:admin_flutter/src/helper/globalHelper.dart';
import 'package:admin_flutter/src/model/loginModel.dart';
import 'package:admin_flutter/src/repository/preference.dart';
import 'package:get/get_connect/connect.dart';

class Api extends GetConnect {
  final String base = '$globalApi/api';
  // final String base = '$globalApi/api';

  // Get request
  // Future<Response> getUser(int id) => get('http://youapi/users/$id');

  // Post request
  Future postLogin(dynamic data) async {
    try {
      var res = await post(
        '$base/login',
        json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );

      if (res.statusCode == 200) {
        return LoginModel.fromMap(res.body);
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

  // Get request
  Future getUser() async {
    String token = '';
    await getToken().then((value) => token = value);

    try {
      var res = await get(
        '$base/user-profile',
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode == 200) {
        // return ProdukModel.fromMap(res.body);
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

  // Post request with File
  // Future<Response<CasesModel>> postCases(List<int> image) {
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
