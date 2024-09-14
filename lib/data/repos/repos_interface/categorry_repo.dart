import 'package:ecommerce/model/categorymodel.dart';

abstract class CategorryRepository{
    Future<CategoryModel> getCategory();
}