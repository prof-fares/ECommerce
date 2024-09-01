import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/constant/strings.dart';

class WishListWebService {
  Future<Map<String, dynamic>?> favoriteCartitems(String usertoken) async {
 
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
          )).get("/api/v1/wishlist");

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
  Future<Map<String, dynamic>?> AddfavoriteItem(String productid, String usertoken) async {
    try {
      final response = await Dio(BaseOptions(
              baseUrl: baseurl,
              receiveDataWhenStatusError: true,
              connectTimeout: Duration(seconds: 20),
              receiveTimeout: Duration(seconds: 20),
              headers: {"token": "$usertoken"}))
          .post("/api/v1/wishlist", data: {"productId": productid});
      if (response.statusCode == 200) {
        return response.data ;// ارجاع البيانات كـ JSON
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
  Future<Map<String, dynamic>?> removeWishlistItem(String productid, String usertoken) async {
    try {
      final response = await Dio(BaseOptions(
          baseUrl: baseurl,
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 20),
          headers: {"token": "$usertoken"})).delete(
        "/api/v1/wishlist/$productid"
      );
      if (response.statusCode == 200) {
      //  print("++++++++++++++++${response.data}+++++++++++++++");
       // print("++++++++++++++++${jsonDecode(response.data)}+++++++++++++++");
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
}