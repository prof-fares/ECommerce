
import 'package:ecommerce/viewmodel/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/constant/colors.dart';


import 'package:ecommerce/view/widgets/productwidgits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
              color: MyColors.mytextblue,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: MyColors.myblue,
                size: 30,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: MyColors.myblue,
                size: 30,
              ),
              onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              bool checkerloaded = state is ItemsLoaded;
              bool chekerloading = state is ItemsLoading;
              bool chekererror = state is ItemsError;
              return checkerloaded
                  ? Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: state.cartItem.numOfCartItems,
                              itemBuilder: (context, i) {
                                final product =
                                    state.cartItem.data!.products![i].product;
                                return ProductFavCartWidget(
                                  iscart: true,
                                  ImageUrl: product!.imageCover.toString(),
                                  title: product.title.toString(),
                                  price: state.cartItem.data!.products![i].price
                                      .toString(),
                                  onremoveItem: () async {
                                    cartBloc.add(RemoveItemEvent(
                                        productid: product.id,
                                       ));
                                  },
                                  onupdate: () {
                                    cartBloc.add(UbdateItemEvent(
                                        productid: product.id,
                                    
                                        count: state.cartItem.data!.products![i]
                                                .count! +
                                            1));
                                  },
                                  onupdate2: () {
                                    if (state.cartItem.data!.products![i]
                                            .count !=
                                        1) {
                                      cartBloc.add(UbdateItemEvent(
                                          productid: product.id,
                                          count: state.cartItem.data!
                                                  .products![i].count! -
                                              1));
                                    }
                                  },
                                  count:
                                      state.cartItem.data!.products![i].count!,
                                );
                              }),
                        ),
                        Container(
                          height: 100.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Total price",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "EGP ${state.cartItem.data!.totalCartPrice}",
                                    style: TextStyle(
                                        color: MyColors.mytextblue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.sp),
                                  )
                                ],
                              ),
                              Container(
                                width: 160.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: MyColors.myblue),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Check Out",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
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
            },
          ),
        ),
      ),
    );
  }
}
