import 'package:ecommerce/view/screens/profilescreen.dart';
import 'package:ecommerce/viewmodel/bloc/BNB/bnb_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/CTB/custom_tab_bar_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/Updateuser/updateuser_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/constant/colors.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/view/screens/categoryscreen.dart';
import 'package:ecommerce/view/screens/homescreen.dart';
import 'package:ecommerce/view/screens/wishlistscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<BottomNavigationBarItem> BNBItem = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    label: "Home",
    icon: Icon(
      Icons.home_outlined,
    ),
  ),
  BottomNavigationBarItem(
    label: "Categories",
    icon: Icon(
      Icons.category_outlined,
    ),
  ),
  BottomNavigationBarItem(
    label: "Favourite",
    icon: Icon(
      Icons.favorite_outline,
    ),
  ),
  BottomNavigationBarItem(
    label: "Account",
    icon: Icon(
      Icons.person_2_outlined,
    ),
  )
];

class HomeNAv extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      // updateServicesWithToken(sl<LogInRepository>().token!);

    final bnbBloc = BlocProvider.of<BnbBloc>(context);
    final categorybloc = BlocProvider.of<CategoryBloc>(context);
    categorybloc.add(StartAutoScroll());
    categorybloc.add(GetCategoryEvent());
    final cartBloc =BlocProvider.of<CartBloc>(context);
    cartBloc.add(GetItemsEvent());
    final WishListBloc wishListBloc =  BlocProvider.of<WishListBloc>(context);
    wishListBloc.add(Getwishlist());


    List<Widget> screens = [
      Home(
      ),
      CategoryScreen(
      ),
      Wishlistscreen(),
      ProfileScreen()
    ];

    return BlocConsumer<BnbBloc, BnbState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(right: 10.w, left: 10.w),
              child: Column(
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        switch (state.navIndex) {
                          case 0:
                            return BlocProvider.value(
                              value: sl<CategoryBloc>(),
                              child: screens[state.navIndex],
                            );
                          case 1:
                            return MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) => CustomTabBarBloc(),
                                ),
                                BlocProvider.value(value: sl<CategoryBloc>())
                              ],
                              child: screens[state.navIndex],
                            );
                          case 2:
                            return BlocProvider<WishListBloc>.value(
                             value: 
                                  sl<WishListBloc>(),
                              child: screens[state.navIndex],
                            );
                          case 3:
                            return BlocProvider<UpdateuserBloc>.value(
                             value: 
                                  sl<UpdateuserBloc>(),
                              child: screens[state.navIndex],
                            ); 
                          default:
                            return BlocProvider<BnbBloc>(
                              create: (BuildContext context) => sl<BnbBloc>(),
                              child: screens[state.navIndex],
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: MyColors.mytextblue),
            backgroundColor: MyColors.myblue,
            items: BNBItem,
            currentIndex: state.navIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              bnbBloc.add(TabChangedEvent(navIndex: value));
              print(state.navIndex);
            },
          ),
        );
      },
    );
  }
}
