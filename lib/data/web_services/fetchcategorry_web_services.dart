import 'package:dio/dio.dart';
import 'package:ecommerce/constant/strings.dart';

class FetchcategorryWebServices {
  Dio? dio;
  FetchcategorryWebServices() {
    BaseOptions options = BaseOptions(
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        baseUrl: baseurl,
        receiveDataWhenStatusError: true);
        dio=Dio(options);
  }
  Future <Map<String,dynamic>?> getCategory ()async{
  try {

      Response response= await dio!.get("/api/v1/categories");
      if(response.statusCode==200){
    
          return response.data;
      }
      else {
       print('=========================== Getcategory failed with status: ${response.statusCode}====================');
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

