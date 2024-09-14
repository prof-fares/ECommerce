import 'package:ecommerce/data/repos/repos_interface/cart_repo.dart';
import 'package:ecommerce/data/repos/repos_interface/categorry_repo.dart';
import 'package:ecommerce/data/repos/repos_interface/curd_repo.dart';
import 'package:ecommerce/data/repos/repos_interface/products_repo.dart';
import 'package:ecommerce/data/repos/repos_interface/regestration_repo.dart';
import 'package:ecommerce/data/repos/repos_interface/wishlist_repo.dart';
import 'package:ecommerce/viewmodel/bloc/BNB/bnb_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/Updateuser/updateuser_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/auth_featuers/auth_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/products/products_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/data/repos/repos_implementation/cart_repo_impl.dart';
import 'package:ecommerce/data/repos/repos_implementation/curd_repo_impl.dart';
import 'package:ecommerce/data/repos/repos_implementation/categorry_repo_impl.dart';
import 'package:ecommerce/data/repos/repos_implementation/products_repo_impl.dart';
import 'package:ecommerce/data/repos/repos_implementation/regestration_repo_impl.dart';
import 'package:ecommerce/data/repos/repos_implementation/wishlist_repo_impl.dart';
import 'package:ecommerce/data/web_services/cart_web_service.dart';
import 'package:ecommerce/data/web_services/curdWebServices.dart';
import 'package:ecommerce/data/web_services/fetchcategorry_web_services.dart';
import 'package:ecommerce/data/web_services/productwebservice.dart';
import 'package:ecommerce/data/web_services/regestration_web_services.dart';
import 'package:ecommerce/data/web_services/wishlist_webService.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;




SetUpServiceLocator({String? token} ){
//wepservices getit

sl.registerLazySingleton<SignUpWebservices>(()=>SignUpWebservices());
sl.registerLazySingleton<LogInWebservices>(()=>LogInWebservices());
sl.registerLazySingleton<FetchcategorryWebServices>(()=>FetchcategorryWebServices());
sl.registerLazySingleton<ProductWebService>(()=>ProductWebService());
sl.registerLazySingleton<CartWebService>(()=>CartWebService(userToken: token ));
sl.registerLazySingleton<WishListWebService>(()=>WishListWebService(userToken: token));
sl.registerLazySingleton<CurdWebServices>(()=>CurdWebServices(userToken: token ));
//repo getit
sl.registerLazySingleton<SignUpRepository>(()=>SignUpRepositoryApi(signupWebservices: sl<SignUpWebservices>()));
sl.registerLazySingleton<CartRepository>(()=>CartRepositoryApi(cartWebService: sl<CartWebService>()));
sl.registerLazySingleton<CurdReposatory>(()=>CurdReposatoryAPI(curdWebServices: sl<CurdWebServices>()));
sl.registerLazySingleton<LogInRepository>(()=>LogInRepositoryApi(logInWebservices: sl<LogInWebservices>()));
sl.registerLazySingleton<CategorryRepository>(()=>CategorryRepositoryApi(fetchcategorryWebServices: sl<FetchcategorryWebServices>()));
sl.registerLazySingleton<ProductsRepository>(()=>ProductsRepositoryApi(productWebService:sl<ProductWebService>()) );
sl.registerLazySingleton<WishlistRepository>(()=>WishlistRepositoryAPi(wishListWebService:sl<WishListWebService>()) );
//bloc getit
sl.registerLazySingleton<AuthBloc>(()=>AuthBloc(logInRepository: sl<LogInRepository>(), signUpRepository: sl<SignUpRepository>()));
sl.registerLazySingleton<CartBloc>(()=>CartBloc(cartRepository: sl<CartRepository>()));
sl.registerLazySingleton<CategoryBloc>(()=>CategoryBloc(fetchCategorryRepository: sl<CategorryRepository>()));
sl.registerLazySingleton<WishListBloc>(()=>WishListBloc(wishlistRepository: sl<WishlistRepository>()));
sl.registerLazySingleton<UpdateuserBloc>(()=>UpdateuserBloc(curdreposatory: sl<CurdReposatory>()));
sl.registerFactory<ProductsBloc>(()=>ProductsBloc(productsRepository: sl<ProductsRepository>()));
sl.registerFactory<BnbBloc>(()=>BnbBloc());
}
void cancelSubscriptions() {
  // Cancel any streams or subscriptions here
  sl<CartBloc>().close();
  sl<AuthBloc>().close();
  sl<CategoryBloc>().close();
  sl<WishListBloc>().close();
  sl<UpdateuserBloc>().close();
  sl<ProductsBloc>().close();
  sl<BnbBloc>().close();
}
// void updateServicesWithToken(String token) {
//   sl<CartWebService>().updateToken(token);
//   sl<WishListWebService>().updateToken(token);
//   sl<CurdWebServices>().updateToken(token);
// }
