import 'package:dio/dio.dart';
import 'package:ecommerce/data/web_services/dioSetUp/dio_client.dart';

class WishListWebService {
  late DioClient _dioClient ;
  String? userToken;
  WishListWebService({ this.userToken}){
    _dioClient=DioClient( );
  }
   void updateToken(String token) {
    userToken = token;
    _dioClient = DioClient();
  }
  Future<Map<String, dynamic>?> favoriteCartitems() async {
 
    try {
      Response response = await _dioClient.getData("/api/v1/wishlist",headers:{"token":userToken});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print('=========================== Get wishlist items failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
  Future<Map<String, dynamic>?> AddfavoriteItem(String productid) async {
    try {
      Response response = await _dioClient.postData("/api/v1/wishlist",data: {"productId": productid},headers:{"token":userToken});
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
  Future<Map<String, dynamic>?> removeWishlistItem(String productid) async {
   try {
      Response response = await _dioClient.removeData("/api/v1/wishlist/$productid",headers:{"token":userToken});
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
}