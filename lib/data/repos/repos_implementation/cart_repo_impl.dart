import 'package:ecommerce/data/repos/repos_interface/cart_repo.dart';
import 'package:ecommerce/model/cartitemmodel.dart';
import 'package:ecommerce/data/web_services/cart_web_service.dart';

class CartRepositoryApi extends CartRepository {
  CartWebService cartWebService;
  CartRepositoryApi({required this.cartWebService});
  @override
  Future <CartItem?> getaCartItems ()async{
   //  print("************************");
   try {
     //  print("************************");
      final respons=await cartWebService.getCartitem();
    return CartItem.fromJson(respons!);
   } catch (e) {
     print("Error accuerd :$e");
       return null;
   }
 
  }
   @override
   Future <CartItem?> UbdateCartItems (String productId,int count)async{
   //  print("************************");
   try {
     //  print("************************");
      final respons=await cartWebService.UbdateCartItem(productId,count);
    return CartItem.fromJson(respons!);
   } catch (e) {
     print("Error accuerd :$e");
       return null;
   }

  }
  @override
  Future <CartItem?> RemoveCartItems (String productId)async{
   //  print("************************");
   try {
     //  print("************************");
      final respons=await cartWebService.removeCartItem(productId);
    return CartItem.fromJson(respons!);
   } catch (e) {
     print("Error accuerd :$e");
       return null;
   }

  }
  @override
 Future <void> AddCartItems (String productId)async{
   //  print("************************");
            //print("**************$productId**********");

   try {
    await cartWebService.AddCartItem(productId);
    
   } catch (e) {
     print("Error accuerd :${e}");
   }
 //  print("********************");
  }

 
}
