import 'package:ecommerce/model/productsmodel.dart';

abstract class ProductsRepository{
  Future<ProductsModel?> getProducts({required String Categoryid});
}