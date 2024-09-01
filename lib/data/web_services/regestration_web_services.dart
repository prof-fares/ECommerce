import 'package:dio/dio.dart';
import 'package:ecommerce/constant/strings.dart';

class LogInWebservices {
  Dio? dio;
  LogInWebservices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      Response response = await dio!.post(
        '/api/v1/auth/signin', //مسار تسجيل الدخول
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data; // ارجاع البيانات كـ JSON
      } else {
        // معالجة الحالة عندما يكون الكود غير 200
        print('===========================Login failed with status: ${response.statusCode}====================');
        return null;
      }
    } on DioError catch (e) {
      // معالجة الأخطاء مثل timeout أو response error
      if (e.response != null) {
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

class SignUpWebservices {
  Dio? dio;
  SignUpWebservices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>?> Signup(String name, String email,String password,String rePassword,String phone) async {
    try {
      Response response = await dio!.post(
        '/api/v1/auth/signup', //مسار تسجيل الدخول
        data: {
          "name": name,
          "email": email,
          "password":password,
          "rePassword": rePassword,
          "phone": phone
        },
      );

      if (response.statusCode == 200) {
        return response.data; // ارجاع البيانات كـ JSON
      } else {
        // معالجة الحالة عندما يكون الكود غير 200
        print('==================Login failed with status: ${response.statusCode}==================');
        return null;
      }
    } on DioError catch (e) {
      // معالجة الأخطاء مثل timeout أو response error
      if (e.response != null) {
        print('====================Error: ${e.response?.data}===================');
        print('===============Status code: ${e.response?.statusCode}========================');
      } else {
        print('==================Error sending request!==================');
        print('==================Error: ${e.message}==================');
      }
      return null;
    }
  }
}
