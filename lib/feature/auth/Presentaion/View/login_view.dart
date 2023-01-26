import 'package:flutter/material.dart';
import 'package:minapharm_task/core/route/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minapharm_task/feature/auth/Presentaion/View/componets/login_form.dart';
import 'package:minapharm_task/feature/auth/Presentaion/View/signup_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              'MinaPharm',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: LoginForm(),
            ),
            SizedBox(
              height: 25.h,
            ),
            InkWell(
              onTap: () => CustomFunctions.pushScreen(
                  widget: const SignupScreen(), context: context),
              child: Text(
                'SignUp',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
