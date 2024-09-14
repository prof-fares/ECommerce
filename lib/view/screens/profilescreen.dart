import 'package:ecommerce/constant/colors.dart';
import 'package:ecommerce/constant/sharedpref.dart';
import 'package:ecommerce/constant/strings.dart';
import 'package:ecommerce/injection.dart';
import 'package:ecommerce/view/screens/loginscreen.dart';
import 'package:ecommerce/viewmodel/bloc/BNB/bnb_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/CTB/custom_tab_bar_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/Categories/category_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/Updateuser/updateuser_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/products/products_bloc.dart';
import 'package:ecommerce/viewmodel/bloc/wishlist/wish_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  void resetAppState() {
    sl<BnbBloc>().add(BNBResetEvent());

  // Access the blocs using Get It and reset their states
  sl<CartBloc>().add(CartResetEvent());
  sl<ProductsBloc>().add(ProductsResetEvent());
  sl<WishListBloc>().add(WishlistResetEvent());
  sl<CategoryBloc>().add(CategoryResetEvent());
  sl<UpdateuserBloc>().add(UpdateResetEvent());
  
  // Add more blocs as needed
}
  @override
  Widget build(BuildContext context) {
    final UpdateBloc = BlocProvider.of<UpdateuserBloc>(context);
    UpdateBloc.add(GetLoggedUserData());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Account",
          style: TextStyle(color: MyColors.myblue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: BlocBuilder<UpdateuserBloc, UpdateuserState>(
          builder: (context, state) {
            bool isLoaded=state is LoggedUserDateGetted;
            bool isupdated=state is Updated;
            return (isLoaded||isupdated)? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Edit your info",
                      style: TextStyle(
                          color: MyColors.myblue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                // تعديل الاسم
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name: ${isupdated?state.updateValue.name:isLoaded?state.name:""} ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: MyColors.mytextblue,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            
                            showEditDataDialog(
                              context,
                              UpdateBloc,
                              "Edit Name",
                              UpdateBloc.nameController,
                              (newValue) {
                                UpdateBloc.add(OnEditData(
                                    nameUpdate: "name",
                                    NewUpdate: UpdateBloc.nameController.text));
                              },
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: MyColors.myblue,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 50.h),

                // تعديل البريد الإلكتروني
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Email: ${isupdated?state.updateValue.email:isLoaded?state.email:""}",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: MyColors.mytextblue,
                              fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {
                            showEditDataDialog(
                              context,
                              UpdateBloc,
                              "Edit Email",
                              UpdateBloc.emailController,
                              (newValue) {
                                UpdateBloc.add(OnEditData(
                                    nameUpdate: "email",
                                    NewUpdate:newValue));
                              },
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: MyColors.myblue,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 50.h),

                // تعديل كلمة المرور
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Password: ******",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: MyColors.mytextblue,
                              fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {
                            showEditPassDialog(
                              context,
                              UpdateBloc,
                              "Edit Password",
                              UpdateBloc.oldPassController,
                              UpdateBloc.newPassController,
                              UpdateBloc.confirmPassController,
                              (putOldPass,putNewPass,putRePass){
                                     UpdateBloc.add(OnEditPass(
                                    currentPass:
                                        putOldPass,
                                    newPass: putNewPass,
                                    confirmNewpass:
                                        putRePass));
                            
                              }
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            color: MyColors.myblue,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Divider(),
                SizedBox(height: 50.h),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.myblue,
                        fixedSize: Size(150.w, 60.h)),
                    onPressed: () async{
                      await TokenManager.removeToken();
                     //  resetAppState();
                     await  sl.reset();
                     await  SetUpServiceLocator(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YmU5OWJhZWQwZGMwMDE2YzcyMTEzNyIsIm5hbWUiOiJlbGtnIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjYxODkwOTcsImV4cCI6MTczMzk2NTA5N30.9wncLZs-J8xDtcoKnBZFRY1y3lSJWm0nb1CZyjnn-QU");
                  //    cancelSubscriptions();

  Navigator.of(context).pushNamedAndRemoveUntil(
                  logInScreen,
                  (Route<dynamic> route) => false,
                   // تمرير قيم reset
                );                    },
                    child: Text(
                      "Log out",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ):state is UpdateLoading?Center(child: CircularProgressIndicator(color: MyColors.myblue,),):Center(child: Text("un expected err"),);
          },
        ),
      ),
    );
  }

  // دالة لعرض الـ Dialog الخاص بالتعديل
  void showEditDataDialog(
    BuildContext context,
    UpdateuserBloc UpdateBloc,
    String title,
    TextEditingController controller,
    Function(String) onSave,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
           controller: controller,
            decoration: InputDecoration(labelText: title),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الـ Dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // تنفيذ العملية المحددة عند الحفظ
                onSave(controller.text);
                Navigator.of(context).pop(); // إغلاق الـ Dialog بعد التعديل
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void showEditPassDialog(
    BuildContext context,
    UpdateuserBloc UpdateBloc,
    String title,
    TextEditingController oldPassController,
    TextEditingController newPassController,
    TextEditingController confirmPassController,
    Function(String oldpass ,String newpass,String repass) onSave,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: Text(title),
          content: Column(
            children: [
              TextField(
                controller: oldPassController,
                decoration: InputDecoration(labelText: "old password"),
                obscureText: true,
              ),
              TextField(
                controller: newPassController,
                decoration: InputDecoration(labelText: "new password"),
                obscureText: true,
              ),
              TextField(
                controller: confirmPassController,
                decoration: InputDecoration(labelText: "confirm password"),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الـ Dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
              onSave(oldPassController.text,newPassController.text,confirmPassController.text);

                Navigator.of(context).pop(); // إغلاق الـ Dialog بعد التعديل
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
