import 'package:ecommerce/view/screens/cartscreen.dart';
import 'package:ecommerce/view/widgets/textformwidgt.dart';
import 'package:ecommerce/viewmodel/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/constant/colors.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/view/screens/productsscreen.dart';
import 'package:ecommerce/view/widgets/categorieswidgets.dart';
import 'package:ecommerce/viewmodel/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
 final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
  CategoryBloc  categorybloc= sl<CategoryBloc>();

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoded) {
          final categorylist = categorybloc.cachedCategoryModel!.data;
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
             
                SizedBox(height: 15.h),
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    return Container(
                      height: 200.h,
                      child: PageView(
                        controller: categorybloc.pageController,
                        children: [
                          Image.asset(
                              fit: BoxFit.fill,
                              'images/Property 1=Default.png'),
                          Image.asset(
                              fit: BoxFit.fill, 'images/Group 12 (1).png'),
                          Image.asset(
                              fit: BoxFit.fill,
                              'images/Property 1=Variant3.png'),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",style: TextStyle(color: MyColors.myblue,fontSize: 20.sp,fontWeight: FontWeight.w600),),
                    TextButton(onPressed: () {}, child: Text("View all",style: TextStyle(color: MyColors.mytextblue),))
                  ],
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ProductScreen(Categoryid: categorylist[1].sId,),));
                  },
                  child: CategoryCard(
                      "https://ae01.alicdn.com/kf/HTB1If5yIFXXXXcSXVXXq6xXFXXX0/New-2017-Casual-Women-Dresses-V-neck-Knee-Length-Colourful-Dress-Plus-Size-High-Waist-Fashion.jpg",
                      categorylist![1].name),
                ),
                SizedBox(height: 10.h),
                InkWell(onTap: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ProductScreen(Categoryid: categorylist[0].sId,),));
                },child: CategoryCard(categorylist[0].image, categorylist[0].name)),
              ],
            ),
          );
        } else {
          return Center(child: Text("Error"));
        }
      },
    );
  }
}
