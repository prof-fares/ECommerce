import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:ecommerce/constant/strings.dart';

class CartWebService {
  Future<Map<String, dynamic>?> UbdateCartItem(String productid, String usertoken,int count) async {
    try {
      final response = await Dio(BaseOptions(
              baseUrl: baseurl,
              receiveDataWhenStatusError: true,
              connectTimeout: Duration(seconds: 20),
              receiveTimeout: Duration(seconds: 20),
              headers: {"token": "$usertoken"}))
          .put("/api/v1/cart/$productid", data: {"count": count.toString()});
      if (response.statusCode == 200) {
        print("succses add : ${response.data}"); 
        return response.data;
        // ارجاع البيانات كـ JSON
      } else {
        // معالجة الحالة عندما يكون الكود غير 200
        print(
            '==================Error statues code: ${response.statusCode}==================');
             return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
      print("********${productid}********");
      print("********${usertoken}********");
      print("********${count}********");
        print(
            '====================Error: ${e.response?.data}===================');
        print(
            '===============Status code: ${e.response?.statusCode}========================');
      } else {
        print('==================Error sending request!==================');
        print('==================Error: ${e.message}==================');
      }
       return null;
    }
  }
Future<Map<String, dynamic>?> AddCartItem(String productid, String usertoken) async {
    try {
      final response = await Dio(BaseOptions(
              baseUrl: baseurl,
              receiveDataWhenStatusError: true,
              connectTimeout: Duration(seconds: 20),
              receiveTimeout: Duration(seconds: 20),
              headers: {"token": "$usertoken"}))
          .post("/api/v1/cart", data: {"productId": productid});
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
         // ارجاع البيانات كـ JSON
      } else {
        // معالجة الحالة عندما يكون الكود غير 200
        print( '==================Error statues code: ${response.statusCode}==================');
              return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
      print("********${productid}********");
      print("********${usertoken}********");
        print(
            '====================Error: ${e.response?.data}===================');
        print(
            '===============Status code: ${e.response?.statusCode}========================');
      } else {
        print('==================Error sending request!==================');
        print('==================Error: ${e.message}==================');
      }
             return null;
    }
  }

  Future<Map<String, dynamic>?> removeCartItem(String productid, String usertoken) async {
    try {
      final response = await Dio(BaseOptions(
          baseUrl: baseurl,
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 20),
          headers: {"token": "$usertoken"})).delete(
        "/api/v1/cart/$productid",
      );
      if (response.statusCode == 200) {
         return response.data;

    
      } else {
        // معالجة الحالة عندما يكون الكود غير 200
        print(
            '==================Error statues code: ${response.statusCode}==================');
            return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(
            '====================Error: ${e.response?.data}===================');
        print(
            '===============Status code: ${e.response?.statusCode}========================');
      } else {
        print('==================Error sending request!==================');
        print('==================Error: ${e.message}==================');
      }
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCartitem(String usertoken) async {
 
    try {
      final response = await Dio(BaseOptions(
          baseUrl: baseurl,
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 20),
          headers: {
            "token":
                "$usertoken"
          }
          )).get("/api/v1/cart");

      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      } else {
   
        print(
            '=========================== fetch error : ${response.statusCode}====================');
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
