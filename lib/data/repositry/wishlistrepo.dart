import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce/data/model/whilshitmodel.dart';
import 'package:ecommerce/data/web_services/wishlist_webService.dart';

class WishlistRepository{
  WishListWebService wishListWebService;
  WishlistRepository({required this.wishListWebService});
  Future<WhilShitModel?> favoriteCartitems(String usertoken) async {
final response=await wishListWebService.favoriteCartitems(usertoken);
return WhilShitModel.fromJson(response!);
  }
  Future<ListidModel?> AddfavoriteItem(String productid, String usertoken) async {
final response =await wishListWebService.AddfavoriteItem(productid, usertoken);
print(response);
return ListidModel.fromJson(response!);
  }
    Future<ListidModel?> removeWishlistItem(String productid, String usertoken) async {
 try {
   final response =await wishListWebService.removeWishlistItem(productid, usertoken);

 return ListidModel.fromJson(response!) ;
 } catch (e) {
   print("-++-+-+---++--+--+$e-++-+-+---++--+--+");
   
 }
    }

}