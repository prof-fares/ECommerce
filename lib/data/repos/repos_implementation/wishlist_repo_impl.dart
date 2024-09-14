
import 'package:ecommerce/data/repos/repos_interface/wishlist_repo.dart';
import 'package:ecommerce/model/whilshitmodel.dart';
import 'package:ecommerce/data/web_services/wishlist_webService.dart';

class WishlistRepositoryAPi extends WishlistRepository{
  WishListWebService wishListWebService;
  WishlistRepositoryAPi({required this.wishListWebService});
  Future<WhilShitModel?> favoriteCartitems( ) async {
final response=await wishListWebService.favoriteCartitems();
return WhilShitModel.fromJson(response!);
  }
  Future<ListidModel?> AddfavoriteItem(String productid ) async {
final response =await wishListWebService.AddfavoriteItem(productid );
print(response);
return ListidModel.fromJson(response!);
  }
    Future<ListidModel?> removeWishlistItem(String productid,) async {
 try {
   final response =await wishListWebService.removeWishlistItem(productid );

 return ListidModel.fromJson(response!) ;
 } catch (e) {
   print("-++-+-+---++--+--+$e-++-+-+---++--+--+");
     return null;
   
 }
    }

}