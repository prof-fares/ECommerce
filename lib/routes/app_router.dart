import 'package:ecommerce/viewmodel/bloc/BNB/bnb_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/auth_featuers/auth_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/constant/strings.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/view/screens/homenavigator.dart';
import 'package:ecommerce/view/screens/loginscreen.dart';
import 'package:ecommerce/view/screens/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late AuthBloc authBloc;
  late CategoryBloc categoryBloc;
  late BnbBloc bnbbloc;
  late CartBloc cartBloc;
  late WishListBloc wishListBloc;
  late String? token;
  AppRouter({ this.token}) {
       authBloc = sl<AuthBloc>();
       categoryBloc = sl<CategoryBloc>();
       bnbbloc=sl<BnbBloc>();
       cartBloc=sl<CartBloc>();
       wishListBloc=sl<WishListBloc>();
  }
  Route? onGenerateRoute(RouteSettings settings) {
   if(token!=null){
    return MaterialPageRoute(
            builder: (_) => (MultiBlocProvider(
                  providers: [
                    BlocProvider<BnbBloc>(
                      create: (BuildContext context) =>bnbbloc,
                    ),
                    BlocProvider.value(
                      value:  categoryBloc,
                    ),
                     BlocProvider.value(
                      value:  cartBloc,
                    ),
                     BlocProvider.value(
                      value:  wishListBloc,
                    ),

                  ],
                  child: HomeNAv(),
                )));
   }
   switch (settings.name) {
      case logInScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: authBloc,
                  child: LoginPage(),
                ));
      case signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: authBloc,
                  child: Signupscreen(),
                ));
      case HomeScreen:
        return MaterialPageRoute(
            builder: (_) => (MultiBlocProvider(
                  providers: [
                    BlocProvider<BnbBloc>(
                      create: (BuildContext context) =>bnbbloc,
                    ),
                    BlocProvider.value(
                      value:  categoryBloc,
                    ),
                     BlocProvider.value(
                      value:  cartBloc,
                    ),
                     BlocProvider.value(
                      value:  wishListBloc,
                    ),

                  ],
                  child: HomeNAv(),
                )));
      default :
       return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: authBloc,
                  child: LoginPage(),
                ));           
    }
  }
}
