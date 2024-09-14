import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget Custombutton({actionname,}) {
  return Container(
    child: Center(
        child: Text("$actionname",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w500))),
    width: 300.w,
    height: 60.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), color: Colors.red),
  );
}
