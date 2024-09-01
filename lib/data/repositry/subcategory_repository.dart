
import 'package:ecommerce/data/model/categorymodel.dart';
import 'package:ecommerce/data/model/subcategorymodel.dart';
import 'package:ecommerce/data/web_services/fetchcategorry_web_services.dart';
import 'package:ecommerce/data/web_services/subcategory_WS.dart';

class FetchSubCategorryRepository {
  final SubCategoryWebService subCategoryWebService;
  
  FetchSubCategorryRepository({required this.subCategoryWebService});

  Future<SubCategoryModel> getSubCategory({required String Categoryid}) async {
    final response = await subCategoryWebService.getSubCategory(Categoryid: Categoryid);
    return SubCategoryModel.fromJson(response!);
  }
}
