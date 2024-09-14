
import 'package:ecommerce/data/repos/repos_interface/categorry_repo.dart';
import 'package:ecommerce/model/categorymodel.dart';
import 'package:ecommerce/data/web_services/fetchcategorry_web_services.dart';


class CategorryRepositoryApi extends CategorryRepository {
  final FetchcategorryWebServices fetchcategorryWebServices;
  
  CategorryRepositoryApi({required this.fetchcategorryWebServices});
@override
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
