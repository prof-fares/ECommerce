import 'package:ecommerce/bussinus_logic/bloc/auth_featuers/auth_bloc.dart';
import 'package:ecommerce/bussinus_logic/bloc/auth_featuers/auth_event.dart';
import 'package:ecommerce/bussinus_logic/bloc/auth_featuers/auth_state.dart';
import 'package:ecommerce/constant/strings.dart';
import 'package:ecommerce/persentation/widgets/textformwidgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          Navigator.of(context).pushNamed(HomeScreen);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF00489A), // Background color
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Text(
                  'Route',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'YourFont', // Make sure you have the font added
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),

                // Welcome Text
                Text(
                  'Welcome Back To Route',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),

                // Subtitle
                Text(
                  'Please sign in with your mail',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),

                // Username Field
                customTextform(
                    controller: authBloc.emailController,
                    label: 'E-mail',
                    hint: 'enter your E-mail'),
                SizedBox(height: 20.h),
                // Password Field
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomPassform(
                      controller: authBloc.passController,
                      visibality: authBloc.passvisaibl,
                      suffixIcon: IconButton(
                        onPressed: () {
                          authBloc.add(TogglePasswordVisibilityEvent());
                        },
                        icon: Icon(
                          authBloc.passvisaibl
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white54,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.h),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password logic
                    },
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                   
                    authBloc.add(LoginEvent(
                        email: "fareselkg@gmail.com",
                        password: "elkg0000"));
                  },
                  style: ElevatedButton.styleFrom(
                    // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if(state is AuthLoading){
                        return CircularProgressIndicator();
                      }
                      else{
                       return Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      );
                      }
                    },
                  ),
                ),
                SizedBox(height: 20.h),

                // Create Account
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, signUpScreen);
                  },
                  child: Text(
                    'Dont have an account? Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
