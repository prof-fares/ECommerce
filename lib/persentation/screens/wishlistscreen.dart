import 'package:ecommerce/bussinus_logic/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/data/repositry/regestration_repositry.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/persentation/widgets/productwidgits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlistscreen extends StatelessWidget {
//CartScreen({required this.cartBloc,required this.token});
  @override
  Widget build(BuildContext context) {
    
    final WishListBloc wishListBloc = sl<WishListBloc>();
    final CartBloc cartBloc=sl<CartBloc>();
    final token = sl<LogInRepository>();
  if((wishListBloc.state is WishListGetted )==false){
    wishListBloc.add(Getwishlist(token: token.token));
  }
   // print(wishListBloc.listid);
    return Scaffold(
        
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<WishListBloc, WishListState>(
                    builder: (context, state) {
                  bool checkerloaded = state is WishListGetted;
                  bool chekerloading = state is WshlistLoading;
                  bool chekererror = state is WshlistError;
                  print("$chekererror");
                  print("$chekerloading");
                  print("$chekererror");
                  // bool checkcount=state is CountChanged;

                  return checkerloaded
                      ? Column(children: [
                          Expanded(
                              child: ListView.builder(
                                  itemCount: state.wishlist.count,
                                  itemBuilder: (context, i) {
                                final product = state.wishlist.data![i]; 
                                
                                
                                return ProductFavCartWidget(iscart: false,ImageUrl: product.imageCover!,title: product.title!,price: product.price.toString(),onremoveItem: () {
                                      print("========================${wishListBloc.listid}======================");
                                      wishListBloc.add(Removewishlist(token: token.token, productid: product.sId,wishlistmodel: state.wishlist));
                                    },
                                     count: product.quantity!,
                                     addtocart: () {
                                       cartBloc.add(AddItemEvent(productid:  product.sId, token:token.token, count: 1));
                                     },
                                    );
                                   
                                  }))
                        ])
                      : chekerloading
                          ? Center(child: CircularProgressIndicator())
                          : chekererror
                              ? Center(
                                  child: Text("${state.message}"),
                                )
                              : Center(
                                  child: Text(
                                      "Unexpection Error please try again later"),
                                );
                }))));
  }
}
