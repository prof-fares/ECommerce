import 'package:dio/dio.dart';
 // هنا هنستخدم => Interceptor pattern 
 //  ايه هو الباترن ده وبنستخدمه ليه ؟ => عشان نقدر نهندل اي عمليات هعملها علي الريكويست اللي انا ببعته للسيرفر في مكان واحد من التطبيق بمعني بدل كما كل شويه هتضطر تكتب نفس الكود الخاص بهندلة الايرور مع كل ريكويست بتبعته لا انا ههندله في مكان واحد بس واباصي اوبجيكت منه للريكوستات وبكده اكون وفرت كتابة كود كتير ملوش لازمه 
class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    String errorMessage = '';

    switch (err.type) {
      case DioErrorType.connectionTimeout:
        errorMessage = "Connection Timeout: The server took too long to respond.with message : ${err.message}";
        break;
      case DioErrorType.sendTimeout:
        errorMessage = "Send Timeout: Failed to send the request in time.with message : ${err.message}";
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = "Receive Timeout: Failed to receive the response in time.with message : ${err.message}";
        break;
      case DioErrorType.badResponse:
        errorMessage = "Response Error: Server responded with status code ${err.response?.statusCode} with message : ${err.message} ";

        break;
      case DioErrorType.cancel:
        errorMessage = "Request Cancelled: The API call was cancelled.with message : ${err.message}";
      case DioExceptionType.badCertificate:
        errorMessage = "Bad Certificate: The SSL/TLS certificate of the server is invalid or not trusted.with message : ${err.message}";
        break;
      case DioExceptionType.connectionError:
        errorMessage = "Connection Error: There was a problem connecting to the network.with message : ${err.message}";
      case DioErrorType.unknown:
        errorMessage = "Unknown Error: ${err.message}";
        break;
    }

    print(errorMessage);

    handler.next(err); 
  }
}