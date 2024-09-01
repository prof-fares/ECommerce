
import 'package:ecommerce/data/model/productsmodel.dart';
import 'package:ecommerce/data/web_services/productwebservice.dart';

class ProductsRepository {
  final ProductWebService productWebService;  
  ProductsRepository({required this.productWebService});
  Future<ProductsModel?> getProducts({required String Categoryid}) async {
    final response = await productWebService.getProducts(Categoryid: Categoryid);
    print("====================");
 print("====================$response=======================");
  try {
    final productsModel=ProductsModel.fromJson(response!);
    print("==================$productsModel===================");
    return productsModel ;
  } catch (e) {
    print("***********************$e********************");
  }
  }
}
