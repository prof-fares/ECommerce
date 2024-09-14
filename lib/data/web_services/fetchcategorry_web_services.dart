import 'package:dio/dio.dart';
import 'package:ecommerce/data/web_services/dioSetUp/dio_client.dart';

class FetchcategorryWebServices {
  DioClient? _dioClient;
  FetchcategorryWebServices() {
    _dioClient = DioClient();
  }
  Future<Map<String, dynamic>?> getCategory() async {
    try {
      Response response = await _dioClient!.getData("/api/v1/categories");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(
            '=========================== Getcategory failed with status: ${response.statusCode}====================');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
