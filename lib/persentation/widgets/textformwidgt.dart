  import 'package:ecommerce/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextform({label,hint,controller}){
  return Column(
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [Text("$label",style:TextStyle(color: Colors.white,fontSize: 16.sp,) ,)],),
      SizedBox(height: 10.h,),
      TextField(
        controller: controller,
                      decoration: InputDecoration(
                     
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                        hintText: '$hint',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
    ],
  );
}
Widget CustomPassform({controller,bool ?visibality,Widget? suffixIcon}){
  return   Column(
    children: [
       Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [Text("Password",style:TextStyle(color: Colors.white,fontSize: 16.sp,) ,)],),
      SizedBox(height: 10.h,),
      TextField(
        controller: controller,
                     obscureText : visibality!,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                        hintText: 'enter your password',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 14.sp,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: suffixIcon
                      ),
                    ),
    ],
  );
}
Widget SearchTextForm ({controller}){
  return  TextField(
    
                decoration: InputDecoration(
                  
                  hintText: 'What do you search for?',
                  prefixIcon: Icon(Icons.search,color: MyColors.myblue,),
                disabledBorder: OutlineInputBorder( borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(30.r),),
                    enabledBorder:OutlineInputBorder( borderSide: BorderSide(color: MyColors.myblue),
                    borderRadius: BorderRadius.circular(30.r),) ,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(30.r),
                    
                  ),
                ),
                controller:controller ,
              );
}