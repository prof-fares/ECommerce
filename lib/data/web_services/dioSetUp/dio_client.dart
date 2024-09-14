import 'package:dio/dio.dart';
import 'package:ecommerce/constant/strings.dart';
import 'package:ecommerce/data/web_services/dioSetUp/dio_interceptor_error.dart';
 // factory method <= وهنا استخدمنا باترن مشهور جدا الا وهو 
 // طب ازي ؟ هنا لو تاخد بالك ان الكود قابل للتوسع بشكل كبير  Open Closed  الا وهو ال  SOLID طب استخدمناه ليه الهدف الرئيسي منه هنا اني خليت الكود يطبق مبدأ رئيسي من مبادئ ال 
 //  :  طب تعالي ندي امثله علي قابلية التوسع اللي انا بتكلم عليها 
 // 1- الي انا مستخدمها ساعتها مش هتضر اروح لكل ريكويست انا باعته واعدل فيه بلفرض انا باعت في التطبيق بتاعي 100 ريكويست هل ينفع اروح اعدل فيهم كلهم ؟ لا طبعا عشان كده بنحطه في مكان واحد واما احب اعدل هعدل فيه  Base options  مثلا تعالي نفترض اني حبيت اغير او اعدل ال 
 // 2-  تاني انا هنا مستخدم واحد بيتعامل مع ال الايررور بس افرض حبيت اضيف واحد يعمل عمليات قبل الريكويست او والريكويست شغال ساعتها برضه هتضر اروح اعدل في كل ريكويست انا باعته وده غلط جداinterceptor تعالي نفترض اني حبيت اضيف  
 // 3- في كل مكان لأ هعدل هنا بس  API  مثلا ساعتها برضه مش هروح اعدل واحط شروطي واضيف ال  Environment  اللي انا شغال عليه تحت شروط او لأغراض معينه زي اختلاف ال API تاني بجانب ال  API بتاعي او حابب اشتغل مثلا علي  base url  تعالي نفترض اني حبيت اغير ال 
 //  وفي سيناريوهات تانيه للتوسيع هيساعدك جدا الباترن ده ده انك تتعامل معاها بدون انك تروح تعدل في كل الكود وهيسهل عليك شغلك جدا 
 // بتاع الميثود اللي هتستخدمها   parameter زي ما انا عامل او مع استخدام السينجلتون هيكون فاكتوري كونستراكتور لو هتنشئه بنفسك يعني  مش باستخدام سيرفس لوكيتور زي جيت ات هنا لا هتضطر تبعتها في ال  Constractur  بتاعك في ال Headers  بس لازم تاخد بالك انك لو استخدمت كده متبعتش ال  singleton وكمان في حاجه هنا حابب اذكرها انت ممكن تخلي الكلاس ده  
class DioClient {
  late Dio dio;

  // Singleton instance
  static final DioClient _instance = DioClient._internal();

  // Private constructor
  DioClient._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
    dio.interceptors.add(ApiErrorInterceptor());
  }

  // Factory constructor that returns the singleton instance
  factory DioClient() {
    return _instance;
  }

  Future<Response> getData(String url, {Map<String, dynamic>? data = const {},Map<String, dynamic>? headers = const {}}) async {
    try {
      final response = await dio.get(url, queryParameters: data,options: Options(headers: headers));
      return response;
    } catch (e) {
      print("Error occurred: $e");
      rethrow;
    }
  }

  Future<Response> postData(String url, {Map<String, dynamic>? data = const {},Map<String, dynamic>? headers = const {}}) async {
    try {
      final response = await dio.post(url, data: data,options: Options(headers: headers));
      return response;
    } catch (e) {
      print("Error occurred: $e");
      rethrow;
    }
  }

  Future<Response> removeData(String url, {Map<String, dynamic>? data = const {},Map<String, dynamic>? headers = const {}}) async {
    try {
      final response = await dio.delete(url, data: data,options: Options(headers: headers));
      return response;
    } catch (e) {
      print("Error occurred: $e");
      rethrow;
    }
  }

  Future<Response> putData(String url, {Map<String, dynamic>? data = const {},Map<String, dynamic>? headers = const {}}) async {
    try {
      final response = await dio.put(url, data: data,options: Options(headers: headers));
      return response;
    } catch (e) {
      print("Error occurred: $e");
      rethrow;
    }
  }
}
