import 'package:dio/dio.dart';
import 'package:ecommerce/constant/strings.dart';

class CurdWebServices {
  Dio? dio;

  Future<Map<String, dynamic>?> ChangeLoggeduserdata(
      {String? nameUpdate, String? NewUpdate, String? usertoken}) async {
    BaseOptions options = BaseOptions(
        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: {"token": usertoken});
    dio = Dio(options);

    try {
      final response = await dio!
          .put("/api/v1/users/updateMe/", data: {nameUpdate = nameUpdate});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(
            '===========================Update failed with status: ${response.statusCode}====================');
        return null;
      }
    } on DioError catch (e) {
      if (e != null) {
        print('Error: ${e.response?.data}');
        print('Status code: ${e.response?.statusCode}');
      } else {
        print('==================Error sending request!==================');
        print('Error: ${e.message}');
      }
      return null;
    }
  }
  Future<Map<String, dynamic>?> ChangeLoggedpass({String? currentPass, String? newPass,String? confirmNewpass, String? usertoken}) async{
        BaseOptions options = BaseOptions(
        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: {"token": usertoken});
    dio = Dio(options);
     try {
      final response = await dio!
          .put("/api/v1/users/changeMyPassword",
           data: {
            "currentPassword" : currentPass,
            "password":newPass,
            "rePassword":confirmNewpass
          }
          );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(
            '===========================Update failed with status: ${response.statusCode}====================');
        return null;
      }
    } on DioError catch (e) {
      if (e != null) {
        print('Error: ${e.response?.data}');
        print('Status code: ${e.response?.statusCode}');
      } else {
        print('==================Error sending request!==================');
        print('Error: ${e.message}');
      }
      return null;
    }
  }
}
