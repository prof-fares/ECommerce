import 'package:dio/dio.dart';
import 'package:ecommerce/constant/strings.dart';
import 'package:flutter/foundation.dart';

class SubCategoryWebService{
  Dio? dio;
 
  SubCategoryWebService(){
        BaseOptions options = BaseOptions(
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        baseUrl: baseurl,
        receiveDataWhenStatusError: true);
        dio=Dio(options);
  }
  Future <Map<String,dynamic>?> getSubCategory ({required String Categoryid})async{
  try {

      Response response= await dio!.get("/api/v1/categories/$Categoryid/subcategories");
      if(response.statusCode==200){
    
          return response.data;
      }
      else {
       print('===========================Login failed with status: ${response.statusCode}====================');
       return null;
      }
    
  } on DioError catch (e) {
    if(e!=null){
     print('Error: ${e.response?.data}');
        print('Status code: ${e.response?.statusCode}');
    }
    else{
       print('==================Error sending request!==================');
        print('Error: ${e.message}');
      }
      return null;
    }
   
  }

}