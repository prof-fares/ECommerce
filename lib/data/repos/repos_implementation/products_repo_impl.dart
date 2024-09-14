
import 'package:ecommerce/data/repos/repos_interface/products_repo.dart';
import 'package:ecommerce/model/productsmodel.dart';
import 'package:ecommerce/data/web_services/productwebservice.dart';

class ProductsRepositoryApi extends ProductsRepository{
  final ProductWebService productWebService;  
  ProductsRepositoryApi({required this.productWebService});
  @override
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
      return null;
  }

  }
}
