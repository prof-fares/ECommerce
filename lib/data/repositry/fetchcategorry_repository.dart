import 'dart:convert';

import 'package:ecommerce/data/model/categorymodel.dart';
import 'package:ecommerce/data/web_services/fetchcategorry_web_services.dart';

import 'package:flutter/material.dart';

class FetchCategorryRepository {
  final FetchcategorryWebServices fetchcategorryWebServices;
  
  FetchCategorryRepository({required this.fetchcategorryWebServices});

  Future<CategoryModel> getCategory() async {
    final response = await fetchcategorryWebServices.getCategory();
    CategoryModel categoryModel = CategoryModel.fromJson(response!);
    
    // فلترة البيانات حسب الفئات المطلوبة
    List<Data>? filteredData = categoryModel.data?.where((category) {
      return category.name == "Men's Fashion" || 
             category.name == "Women's Fashion"  ;
    }).toList();
    
    // تعيين البيانات المفلترة
    categoryModel.data = filteredData;
    
    return categoryModel;
  }
}
