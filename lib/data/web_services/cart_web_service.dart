
import 'package:dio/dio.dart';
import 'package:ecommerce/data/web_services/dioSetUp/dio_client.dart';

class CartWebService {
  late DioClient _dioClient ;
  String? userToken;
  CartWebService({ this.userToken}) {

    _dioClient=DioClient( );
  }
   void updateToken(String token) {
    userToken = token;
    _dioClient = DioClient();
  }
  Future<Map<String, dynamic>?> UbdateCartItem(
      String productid,  int count) async {
    try {
      Response response = await _dioClient.putData("/api/v1/cart/$productid",data:{"count": count.toString()},headers:{"token":userToken});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('=========================== Update products failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> AddCartItem(
      String productid) async {
   try {
      Response response = await _dioClient.postData("/api/v1/cart", data: {"productId": productid},headers:{"token":userToken});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('=========================== Add product failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> removeCartItem(
      String productid) async {
   try {
      Response response = await _dioClient.removeData("/api/v1/cart/$productid",headers:{"token":userToken});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('=========================== Remove product failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getCartitem() async {
 try {
      Response response = await _dioClient.getData("/api/v1/cart",headers:{"token":userToken});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('=========================== Get cart items failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
