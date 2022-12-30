import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:list/model/user_model.dart';

class UserServices {
// Спосіб без скачуванням

  final String apiUrl =
      'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';

  final Dio _api = Dio();

  Future<UserModel?> getUser() async {
  UserModel? user;
  try {
    Response userData = await _api.get(apiUrl);
    print('User Info: ${userData.data}');
    user = UserModel.fromJson(userData.data);
  } on DioError catch (e) {
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      print('Error sending request!');
      print(e.message);
    }
  }
  return user;
}

  Future<UserModel?> getImage() async {
  UserModel? user;
  try {
    Response userData = await _api.get(apiUrl, queryParameters: {
      'image': user!.image,
    },);
    print('User Info: ${userData.data}');
    user = UserModel.fromJson(userData.data);
  } on DioError catch (e) {
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      print('Error sending request!');
      print(e.message);
    }
  }
  return user;
}

// Спосіб зі скачуванням
  // Future<String> _loadAStudentAsset() async {
  //   return await rootBundle.loadString('assets/jsons/response.json');
  // }

  // Future<UserModel?> getUser() async {
  //   String jsonString = await _loadAStudentAsset();
  //   final jsonResponse = json.decode(jsonString);
  //   UserModel user = UserModel.fromJson(jsonResponse);
  //   return user;
  // }

}
