import 'package:ecommerce/app_router.dart';
import 'package:ecommerce/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SetUpServiceLocator();
  runApp(MyApp(router: AppRouter(),));
}

class MyApp extends StatelessWidget {
   final AppRouter router ;
  const MyApp({super.key,required this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.onGenerateRoute  ,
      ),
    );
  }
}



