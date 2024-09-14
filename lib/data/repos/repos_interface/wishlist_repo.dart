import 'package:ecommerce/model/whilshitmodel.dart';

abstract class WishlistRepository{
   Future<WhilShitModel?> favoriteCartitems() ;
     Future<ListidModel?> AddfavoriteItem(String productid);
       Future<ListidModel?> removeWishlistItem(String productid);
}