import 'package:dio/dio.dart';
import 'package:ecommerce/data/model/cartitemmodel.dart';
import 'package:ecommerce/data/web_services/cart_web_service.dart';

class CartRepository {
  CartWebService cartWebService;
  CartRepository({required this.cartWebService});
  Future <CartItem?> getaCartItems (String usertoken)async{
     print("************************");
   try {
       print("************************");
      final respons=await cartWebService.getCartitem(usertoken);
    return CartItem.fromJson(respons!);
   } catch (e) {
     print("Error accuerd :$e");
   }
   print("********************");
  }
   Future <CartItem?> UbdateCartItems (String usertoken,String productId,int count)async{
     print("************************");
   try {
       print("************************");
      final respons=await cartWebService.UbdateCartItem(usertoken,productId,count);
    return CartItem.fromJson(respons!);
   } catch (e) {
     print("Error accuerd :$e");
   }
   print("********************");
  }
  Future <CartItem?> RemoveCartItems (String usertoken,String productId)async{
     print("************************");
   try {
       print("************************");
      final respons=await cartWebService.removeCartItem(usertoken,productId);
    return CartItem.fromJson(respons!);
   } catch (e) {
     print("Error accuerd :$e");
   }
   print("********************");
  }
 Future <void> AddCartItems (String usertoken,String productId)async{
     print("************************");
            print("**************$productId**********");

   try {
      final respons=await cartWebService.AddCartItem(usertoken,productId);
    
   } catch (e) {
     print("Error accuerd :${e}");
   }
   print("********************");
  }

 
}
