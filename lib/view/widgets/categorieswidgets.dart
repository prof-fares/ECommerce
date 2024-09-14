
import 'package:ecommerce/constant/colors.dart';



import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CategoryCard(uri, categorieName) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            opacity: 0.8, fit: BoxFit.fill, image: NetworkImage("$uri"))),
    height: 300.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 15.w,
            ),
            Text(
              "$categorieName",
              style: TextStyle(
                  shadows: [BoxShadow(spreadRadius: 200, blurRadius: 10)],
                  fontSize: 20.sp,
                  color: MyColors.mytextblue,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Center(
                  child: Text(
                "Explore",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              width: 160.w,
              height: 80.h,
              decoration: BoxDecoration(
                  color: MyColors.myblue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100))),
            )
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 80.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
            )
          ],
        ),
      ],
    ),
  );
}


