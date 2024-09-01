import 'package:ecommerce/bussinus_logic/bloc/BNB/bnb_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/auth_featuers/auth_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/products/products_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/constant/strings.dart';
import 'package:ecommerce/data/repositry/regestration_repositry.dart';
import 'package:ecommerce/data/web_services/regestration_web_services.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/persentation/screens/homenavigator.dart';
import 'package:ecommerce/persentation/screens/homescreen.dart';
import 'package:ecommerce/persentation/screens/loginscreen.dart';
import 'package:ecommerce/persentation/screens/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late AuthBloc authBloc;
  late CategoryBloc categoryBloc;
  late BnbBloc bnbbloc;
  late CartBloc cartBloc;
  late WishListBloc wishListBloc;

  AppRouter() {
    authBloc = sl<AuthBloc>();
       categoryBloc = sl<CategoryBloc>();
       bnbbloc=sl<BnbBloc>();
       cartBloc=sl<CartBloc>();
       wishListBloc=sl<WishListBloc>();
  }
  Route? onGenerateRoute(RouteSettings settings) {
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
    }
  }
}
