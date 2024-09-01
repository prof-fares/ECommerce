import 'package:ecommerce/bussinus_logic/bloc/CTB/custom_tab_bar_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/products/products_bloc.dart';
import 'package:ecommerce/constant/colors.dart';
import 'package:ecommerce/data/model/categorymodel.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/persentation/widgets/productwidgits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabbarbloc = BlocProvider.of<CustomTabBarBloc>(context);
    CategoryBloc categorybloc = sl<CategoryBloc>();
    final categorylist = categorybloc.cachedCategoryModel!.data;

    //final categorybloc = BlocProvider.of<CategoryBloc>(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.h),
          // PageView for Main Categories
          Container(
            height: 45.h,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 65, 130, 0.4),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(onTap: () {
                    //    print("=========================xxxx==================");

                    tabbarbloc
                        .add(OnTapEvent(lightMenF: false, lightWomenF: true));
                  }, child: BlocBuilder<CustomTabBarBloc, CustomTabBarState>(
                    builder: (context, state) {
                      return Container(
                          decoration: BoxDecoration(
                              color: (state is TabChangedState &&
                                      state.lightWomenF == true)
                                  ? MyColors.myblue
                                  : (state is TabChangedState &&
                                          state.lightWomenF == false)
                                      ? Color.fromARGB(0, 93, 77, 77)
                                      : MyColors.myblue),
                          child: Center(
                              child: Text(
                            "Women's Fashion",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: Colors.white),
                          )));
                    },
                  )),
                ),
                Expanded(
                  child: InkWell(onTap: () {
                    // print("=========================xxxx==================");
                    tabbarbloc
                        .add(OnTapEvent(lightMenF: true, lightWomenF: false));
                  }, child: BlocBuilder<CustomTabBarBloc, CustomTabBarState>(
                    builder: (context, state) {
                      return Container(
                          decoration: BoxDecoration(
                              color: (state is TabChangedState &&
                                      state.lightMenF == true)
                                  ? MyColors.myblue
                                  : (state is TabChangedState &&
                                          state.lightMenF == false)
                                      ? Color.fromARGB(0, 255, 255, 255)
                                      : Color.fromARGB(0, 255, 255, 255)),
                          child: Center(
                              child: Text(
                            "Men's Fashion",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color: Colors.white),
                          )));
                    },
                  )),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),
//Container(child:TabBar(tabs: [],) ,),
          // GridView for Sub Categories
          //   Text("Products",style: TextStyle(color: MyColors.myblue,fontSize: 20.sp,fontWeight: FontWeight.w600),),
          // SizedBox(height: 20.h),
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<ProductsBloc>(),
              ),
              // BlocProvider.value(
              //   value:  sl<CartBloc>(),
              // ),
            ],
            child: BlocBuilder<CustomTabBarBloc, CustomTabBarState>(
              builder: (context, state) {
                return Expanded(
                  child: ProductGridView(
                      Categoryid:
                          (state is TabChangedState && state.lightMenF == true)
                              ? categorylist![0].sId.toString()
                              : (state is TabChangedState &&
                                      state.lightMenF == false)
                                  ? categorylist![1].sId.toString()
                                  : categorylist![1].sId.toString()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
