import 'package:ecommerce/bussinus_logic/bloc/BNB/bnb_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/Updateuser/updateuser_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/auth_featuers/auth_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/products/products_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/data/repositry/cartreposatory.dart';
import 'package:ecommerce/data/repositry/curdreposatory.dart';
import 'package:ecommerce/data/repositry/fetchcategorry_repository.dart';
import 'package:ecommerce/data/repositry/productsrepository.dart';
import 'package:ecommerce/data/repositry/regestration_repositry.dart';
import 'package:ecommerce/data/repositry/wishlistrepo.dart';
import 'package:ecommerce/data/web_services/cart_web_service.dart';
import 'package:ecommerce/data/web_services/curdWebServices.dart';
import 'package:ecommerce/data/web_services/fetchcategorry_web_services.dart';
import 'package:ecommerce/data/web_services/productwebservice.dart';
import 'package:ecommerce/data/web_services/regestration_web_services.dart';
import 'package:ecommerce/data/web_services/wishlist_webService.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;
SetUpServiceLocator(){
//wepservices getit
sl.registerLazySingleton<SignUpWebservices>(()=>SignUpWebservices());
sl.registerLazySingleton<CartWebService>(()=>CartWebService());
sl.registerLazySingleton<LogInWebservices>(()=>LogInWebservices());
sl.registerLazySingleton<FetchcategorryWebServices>(()=>FetchcategorryWebServices());
sl.registerLazySingleton<ProductWebService>(()=>ProductWebService());
sl.registerLazySingleton<WishListWebService>(()=>WishListWebService());
sl.registerLazySingleton<CurdWebServices>(()=>CurdWebServices());
//repo getit
sl.registerLazySingleton<SignUpRepository>(()=>SignUpRepository(signupWebservices: sl<SignUpWebservices>()));
sl.registerLazySingleton<CartRepository>(()=>CartRepository(cartWebService: sl<CartWebService>()));
sl.registerLazySingleton<Curdreposatory>(()=>Curdreposatory(curdWebServices: sl<CurdWebServices>()));
sl.registerLazySingleton<LogInRepository>(()=>LogInRepository(logInWebservices: sl<LogInWebservices>()));
sl.registerLazySingleton<FetchCategorryRepository>(()=>FetchCategorryRepository(fetchcategorryWebServices: sl<FetchcategorryWebServices>()));
sl.registerLazySingleton<ProductsRepository>(()=>ProductsRepository(productWebService:sl<ProductWebService>()) );
sl.registerLazySingleton<WishlistRepository>(()=>WishlistRepository(wishListWebService:sl<WishListWebService>()) );



//bloc getit
sl.registerLazySingleton<AuthBloc>(()=>AuthBloc(logInRepository: sl<LogInRepository>(), signUpRepository: sl<SignUpRepository>()));
sl.registerLazySingleton<CartBloc>(()=>CartBloc(cartRepository: sl<CartRepository>()));
sl.registerLazySingleton<CategoryBloc>(()=>CategoryBloc(fetchCategorryRepository: sl<FetchCategorryRepository>()));
sl.registerLazySingleton<WishListBloc>(()=>WishListBloc(wishlistRepository: sl<WishlistRepository>()));
sl.registerLazySingleton<UpdateuserBloc>(()=>UpdateuserBloc(curdreposatory: sl<Curdreposatory>()));
sl.registerFactory<ProductsBloc>(()=>ProductsBloc(productsRepository: sl<ProductsRepository>()));
sl.registerFactory<BnbBloc>(()=>BnbBloc());

}