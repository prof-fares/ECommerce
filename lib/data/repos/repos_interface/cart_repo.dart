import 'package:ecommerce/model/cartitemmodel.dart';

abstract class CartRepository{
  Future <CartItem?> getaCartItems ();
  Future <CartItem?> UbdateCartItems (String productId,int count);
  Future <CartItem?> RemoveCartItems (String productId);
  Future <void> AddCartItems (String productId);
}