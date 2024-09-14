import 'package:dio/dio.dart';
import 'package:ecommerce/data/web_services/dioSetUp/dio_client.dart';

class ProductWebService{
 DioClient? _dioClient;
ProductWebService(){
    _dioClient = DioClient();
  }
  Future <Map<String,dynamic>?> getProducts({required String Categoryid})async{
   try {
      Response response = await _dioClient!.getData("/api/v1/products?category[in]=$Categoryid");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('=========================== Get products failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

}