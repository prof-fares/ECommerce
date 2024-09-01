import 'package:ecommerce/bussinus_logic/bloc/products/products_bloc.dart';
import 'package:ecommerce/constant/colors.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/persentation/widgets/productwidgits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  String? Categoryid;

  ProductScreen({required this.Categoryid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: MyColors.myblue,
          ),
          title: Text("Products",
              style: TextStyle(
                  color: MyColors.myblue,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              // Row(
              //   children: [
              //     Text("Products",
              //         style: TextStyle(
              //             color: MyColors.myblue,
              //             fontSize: 20.sp,
              //             fontWeight: FontWeight.w600))
              //   ],
              // ),
              // SizedBox(height: 10.h,),
              MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (BuildContext context) => sl<ProductsBloc>()),
                      
                ],
                child: Expanded(child: ProductGridView(Categoryid: Categoryid)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
