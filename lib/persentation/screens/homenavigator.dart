import 'package:ecommerce/bussinus_logic/bloc/BNB/bnb_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/CTB/custom_tab_bar_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/wishlist/wish_list_bloc.dart';
import 'package:ecommerce/constant/colors.dart';
import 'package:ecommerce/data/repositry/regestration_repositry.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/persentation/screens/cartscreen.dart';
import 'package:ecommerce/persentation/screens/categoryscreen.dart';
import 'package:ecommerce/persentation/screens/homescreen.dart';
import 'package:ecommerce/persentation/screens/wishlistscreen.dart';
import 'package:ecommerce/persentation/widgets/textformwidgt.dart';
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
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bnbBloc = BlocProvider.of<BnbBloc>(context);
    final categorybloc = BlocProvider.of<CategoryBloc>(context);
    
    categorybloc.add(StartAutoScroll());
    categorybloc.add(GetCategoryEvent());

    final cartBloc =BlocProvider.of<CartBloc>(context);
    final token = sl<LogInRepository>();
    cartBloc.add(GetItemsEvent(token: token.token));
    final WishListBloc wishListBloc =  BlocProvider.of<WishListBloc>(context);
    wishListBloc.add(Getwishlist(token: token.token));


    List<Widget> screens = [
      Home(
      ),
      CategoryScreen(
      ),
      Wishlistscreen(),
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
                  Row(
                    children: [
                      Text(
                        "   Route",
                        style: TextStyle(
                            color: MyColors.mytextblue,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SearchTextForm(controller: controller),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                      value: sl<CartBloc>(),
                                      child: CartScreen(),
                                    )));
                          },
                          icon: Icon(
                            Icons.shopping_cart_rounded,
                            size: 30.sp,
                            color: MyColors.myblue,
                          ))
                    ],
                  ),
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
