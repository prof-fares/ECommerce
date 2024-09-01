import 'package:dio/dio.dart';
import 'package:ecommerce/constant/strings.dart';

class ProductWebService{
  Dio? dio;
 
  ProductWebService(){
        BaseOptions options = BaseOptions(
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        baseUrl: baseurl,
        receiveDataWhenStatusError: true);
        dio=Dio(options);
  }
  Future <Map<String,dynamic>?> getProducts({required String Categoryid})async{
  try {

      Response response= await dio!.get("/api/v1/products?category[in]=$Categoryid");
      if(response.statusCode==200){  
        print(response.data);
          return response.data;
      }
      else {
       print('=========================== fetch error : ${response.statusCode}====================');
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