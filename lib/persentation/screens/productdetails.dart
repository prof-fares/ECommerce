import 'package:ecommerce/bussinus_logic/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/products/products_bloc.dart';
import 'package:ecommerce/constant/colors.dart';

import 'package:ecommerce/data/model/productsmodel.dart';
import 'package:ecommerce/data/repositry/regestration_repositry.dart';
import 'package:ecommerce/injection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductDetailsScreen extends StatelessWidget {
  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange
  ];
  Data? productData;
  List<String>? images;
  PageController _pageController = PageController();
  ProductDetailsScreen({required this.productData}) {
    images = productData!.images;
  }

  int _currentPage = 0;

  // Sample images list (replace with actual image URLs or assets)

  @override
  Widget build(BuildContext context) {
   
    final productbloc = BlocProvider.of<ProductsBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: MyColors.myblue, width: 1.w)),
                    height: 250.h,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: images!.length,
                      onPageChanged: (index) {
                        _currentPage = index;
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(images![index]))),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 8.h,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(images!.length, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          height: 8.h,
                          width: _currentPage == index ? 12.w : 8.w,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? MyColors.myblue
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${productData!.title!.split(" ")[0]} ${productData!.title!.split(" ")[1]}',
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: MyColors.mytextblue),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Text('${productData!.sold} Sold',
                                  style: TextStyle(color: Colors.grey)),
                              SizedBox(width: 16.w),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 16.sp),
                                  SizedBox(width: 4.w),
                                  Text(
                                      '${productData!.ratingsAverage} (${productData!.ratingsQuantity})',
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'EGP ${productData!.price}',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: MyColors.mytextblue),
                          ),
                          Container(
                            width: 150.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: MyColors.myblue),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      productbloc.add(IncreaseQuantity());
                                    },
                                    icon: Icon(
                                      Icons.add_circle_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                                BlocBuilder<ProductsBloc, ProductsState>(
                                  builder: (context, state) {
                                    final checker = state is QuantityChanged;
                                    return checker
                                        ? Text(
                                            "${state.newvalue}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp),
                                          )
                                        : Text(
                                            "${productbloc.quantity}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp),
                                          );
                                  },
                                ),
                                IconButton(
                                    onPressed: () {
                                      productbloc.add(DecreaseQuantity());
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.mytextblue),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '${productData!.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Size',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.mytextblue),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      return BlocBuilder<ProductsBloc, ProductsState>(
                        builder: (context, state) {
                          final checker = state is SizeChangeState;
                          return checker
                              ? ChoiceChip(
                                  selectedColor: MyColors.myblue,
                                  shape: CircleBorder(
                                      eccentricity: 0.5,
                                      side: BorderSide(color: MyColors.myblue)),
                                  label: Text(
                                    '${38 + index}',
                                    style:
                                        TextStyle(color: MyColors.mytextblue),
                                  ),
                                  selected: index == state.index,
                                  onSelected: (value) {
                                    productbloc
                                        .add(SizeChangeEvent(index: index));
                                  }, // Example selection
                                )
                              : ChoiceChip(
                                  selectedColor: MyColors.myblue,
                                  shape: CircleBorder(
                                      eccentricity: 0.5,
                                      side: BorderSide(color: MyColors.myblue)),
                                  label: Text(
                                    '${38 + index}',
                                    style:
                                        TextStyle(color: MyColors.mytextblue),
                                  ),
                                  selected: index == -1, // Example selection
                                  onSelected: (selected) {
                                    productbloc
                                        .add(SizeChangeEvent(index: index));
                                  },
                                );
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Color',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: MyColors.mytextblue),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          5,
                          (i) => BlocBuilder<ProductsBloc, ProductsState>(
                                  builder: (context, state) {
                                final checker = state is ColorChangeState;
                                return checker
                                    ? ChoiceChip(
                                        onSelected: (value) {
                                          productbloc
                                              .add(ColorChangeEvent(index: i));
                                        },
                                        selected: i == state.index,
                                        checkmarkColor: Colors.white,
                                        label: Text(""),
                                        shape: CircleBorder(eccentricity: 0.5),
                                        color:
                                            WidgetStatePropertyAll(colors[i]),
                                      )
                                    : ChoiceChip(
                                        onSelected: (value) {
                                          productbloc
                                              .add(ColorChangeEvent(index: i));
                                        },
                                        checkmarkColor: Colors.white,
                                        label: Text(""),
                                        selected: i == -1,
                                        shape: CircleBorder(eccentricity: 0.5),
                                        color:
                                            WidgetStatePropertyAll(colors[i]),
                                      );
                              }))),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: MyColors.mytextblue),
                          ),
                          SizedBox(height: 8.h),
                          BlocBuilder<ProductsBloc, ProductsState>(
                            builder: (context, state) {
                              final checker = state is QuantityChanged;
                              return checker
                                  ? Text(
                                      'EGP ${state.newvalue * productData!.price}',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.mytextblue),
                                    )
                                  : Text(
                                      'EGP ${productData!.price}',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.mytextblue),
                                    );
                            },
                          ),
                        ],
                      ),
                      BlocListener<CartBloc,CartState>(
                        listener: (context, state) {
                          if (state is ItemsLoading){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: CircularProgressIndicator(),)));
                          }
                          else if(state is ItemsLoaded){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Added To Cart")));

                          }
                          else {Text("Error");}
                        },
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            final token = sl<LogInRepository>();
                               final AddItem = sl<CartBloc>();
    
                            AddItem.add(await AddItemEvent(
                                productid: productData!.id,
                                token: token.token,
                                count: productbloc.quantity));
                        
                          },
                          style: ElevatedButton.styleFrom(
                              //    maximumSize: Size(190.w, 80.h),
                              minimumSize: Size(190.w, 60.h),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              backgroundColor: MyColors.myblue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
