import 'package:dio/dio.dart';
import 'package:ecommerce/data/web_services/dioSetUp/dio_client.dart';

class LogInWebservices {
  DioClient? _dioClient;
  LogInWebservices() {
       _dioClient =DioClient();
  }
  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      print(_dioClient);
      Response response = await _dioClient!.postData(
        '/api/v1/auth/signin', 
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
  
        print('=========================== Login failed with status: ${response.statusCode} ============================');
        return null;
      }
    } catch (e) {
      print('=========================== Error occurred: $e ===========================');
      return null;
    }
  }
}

class SignUpWebservices {
  DioClient? _dioClient;
  Dio? dio;
  SignUpWebservices() {
  _dioClient =DioClient();
  }
  Future<Map<String, dynamic>?> Signup(String name, String email,String password,String rePassword,String phone) async {
   
     try {
      Response response = await _dioClient!.postData(
        '/api/v1/auth/signup',
         data: {
          "name": name,
          "email": email,
          "password":password,
          "rePassword": rePassword,
          "phone": phone
        },
      );

      if (response.statusCode == 200) {
        return response.data; 
      } else {
        // معالجة الحالة عندما يكون الكود غير 200
        print('=========================== SignUp failed with status: ${response.statusCode} ============================');
        return null;
      }
    } catch (e) {
      print('=========================== Error occurred: $e ===========================');
      return null;
    }
    }
  }

