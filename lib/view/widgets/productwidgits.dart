
import 'package:ecommerce/viewmodel/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/view/screens/productdetails.dart';
import 'package:ecommerce/viewmodel/bloc/products/products_bloc.dart';
import 'package:ecommerce/constant/colors.dart';
import 'package:ecommerce/model/productsmodel.dart';
import 'package:ecommerce/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Data productresponse;
 final List listid;
  final void Function()? ontapfav;
 final bool itemsLoading;

  ProductCard(
      {Key? key,
      required this.productresponse,
   required this.listid,
       this.ontapfav,
       required this.itemsLoading});

  @override
  Widget build(BuildContext context) {
 
  

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                child: Image.network(
                  productresponse.imageCover.toString(),
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  top: 8.h,
                  right: 8.w,
                  child:itemsLoading?Center(child: CircularProgressIndicator(color: MyColors.myblue,),): CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                          icon: Icon(
                            listid.contains(productresponse.sId)
                                ? Icons.favorite_sharp
                                : Icons.favorite_border_outlined,
                            color: MyColors.myblue,
                          ),
                          onPressed: ontapfav))),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productresponse.title.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  productresponse.description.toString(),
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  'EGP ${productresponse.price}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Review (${productresponse.ratingsAverage}) ⭐',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductGridView extends StatelessWidget {
final  String? Categoryid;

  ProductGridView({required this.Categoryid});
  @override
  Widget build(BuildContext context) {
    final productsbloc = BlocProvider.of<ProductsBloc>(context);
    final wishlistbloc = sl<WishListBloc>();

    productsbloc.add(GetProductsEvent(Categoryid: Categoryid!));
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.8,
            ),
            itemCount: state.productsModel.data!.length,
            itemBuilder: (context, index) {
              final product = state.productsModel.data![index];
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => MultiBlocProvider(
                              providers: [
                                BlocProvider<ProductsBloc>(
                                    create: (BuildContext context) =>
                                        sl<ProductsBloc>()),
                                BlocProvider.value(value: sl<CartBloc>())
                              ],
                              child: ProductDetailsScreen(
                                productData: product,
                              ),
                            )));
                  },
                  child: BlocProvider.value(
                    value: sl<WishListBloc>(),
                    child: BlocBuilder<WishListBloc, WishListState>(
                      builder: (context, state) {
                      state as WishListGetted;
                     
                          return ProductCard(
                            itemsLoading:wishlistbloc.loading!,
                            ontapfav: () {
                              if (state.wishlistid.contains(product.sId) ==
                                  false) {
                                wishlistbloc.add(Addwishlist(
                                    wishlistmodel:
                                        (wishlistbloc.state as WishListGetted)
                                            .wishlist,
                                 
                                    productid: product.sId));
                              }
                              else{
                                wishlistbloc.add(Removewishlist( productid: product.sId,wishlistmodel:  (wishlistbloc.state as WishListGetted)
                                            .wishlist,));
                              }
                            },
                            listid: state.wishlistid,
                            productresponse: product,
                          );
                      
                  
                      },
                    ),
                  ));
            },
          );
        } else if (state is ProducdtsLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: MyColors.myblue,
          ));
        } else if (state is ProductsError) {
          return Center(child: Text("${state.message}"));
        } else {
          return Center(child: Text("xxxx"));
        }
      },
    );
  }
}

Widget ProductFavCartWidget({
  required bool iscart,
  required String ImageUrl,
  required String title,
  required String price,
  required void Function() onremoveItem,
  void Function()? onupdate,
  void Function()? onupdate2,
  void Function()? addtocart,
  required num count,
}) {
  return Container(
    child: Row(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage("${ImageUrl}"))),
            )),
        Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${title}",
                  style: TextStyle(
                      color: MyColors.mytextblue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      overflow: TextOverflow.ellipsis),
                ),
                //   SizedBox(height: 50.h,),
                Text(
                  "EGP ${price}",
                  style: TextStyle(
                      color: MyColors.mytextblue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                )
              ],
            )),
        Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      iscart
                          ? IconButton(
                              onPressed: onremoveItem,
                              icon: Icon(
                                Icons.delete_outline,
                                size: 30.sp,
                                color: MyColors.myblue,
                              ))
                          : IconButton(
                              onPressed: onremoveItem,
                              icon: Icon(
                                Icons.favorite_sharp,
                                size: 30.sp,
                                color: MyColors.myblue,
                              )),
                    ],
                  ),
                  iscart
                      ? Container(
                          width: 120.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MyColors.myblue),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: onupdate,
                                  icon: Icon(
                                    Icons.add_circle_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                              //checkcount?
                              Text(
                                "${count}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              )
                              // :
                              // Text(
                              //   "${state.cartItem.data!.products![i].count!}",
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 20.sp),
                              // )
                              ,
                              IconButton(
                                  onPressed: onupdate2,
                                  icon: Icon(
                                    Icons.remove_circle_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: addtocart,
                          child: Container(
                              width: 120.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: MyColors.myblue),
                              child: Center(
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.sp),
                                ),
                              )),
                        )
                ],
              ),
            ))
      ],
    ),
    height: 200.h,
    width: double.infinity,
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyColors.myblue, width: 1.w)),
  );
}
