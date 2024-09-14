import 'package:ecommerce/constant/colors.dart';
import 'package:ecommerce/data/repos/repos_interface/regestration_repo.dart';
import 'package:ecommerce/view/screens/cartscreen.dart';
import 'package:ecommerce/view/widgets/textformwidgt.dart';
import 'package:ecommerce/viewmodel/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/view/widgets/productwidgits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wishlistscreen extends StatelessWidget {
//CartScreen({required this.cartBloc,required this.token});
 final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    final WishListBloc wishListBloc = sl<WishListBloc>();
    final CartBloc cartBloc=sl<CartBloc>();
    final token = sl<LogInRepository>();
  if((wishListBloc.state is WishListGetted )==false){
    wishListBloc.add(Getwishlist());
  }
   // print(wishListBloc.listid);
    return Scaffold(
        
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                    children: [
                      Text(
                        "   Route",
                        style: TextStyle(
                            color: MyColors.mytextblue,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SearchTextForm(controller: controller),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                      value: sl<CartBloc>(),
                                      child: CartScreen(),
                                    )));
                          },
                          icon: Icon(
                            Icons.shopping_cart_rounded,
                            size: 30.sp,
                            color: MyColors.myblue,
                          ))
                    ],
                  ),
                  SizedBox(height: 10.h,),
                    Expanded(
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
                                            wishListBloc.add(Removewishlist( productid: product.sId,wishlistmodel: state.wishlist));
                                          },
                                           count: product.quantity!,
                                           addtocart: () {
                                             cartBloc.add(AddItemEvent(productid:  product.sId, count: 1));
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
                      }),
                    ),
                  ],
                ))));
  }
}
