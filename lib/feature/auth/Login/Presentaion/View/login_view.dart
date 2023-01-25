import 'package:flutter/material.dart';
import 'package:minapharm_task/core/local_db/hive.dart';
import 'package:minapharm_task/core/route/navigation.dart';
import 'package:minapharm_task/feature/auth/Login/Presentaion/Cubit/login_cubit.dart';
import 'package:minapharm_task/feature/auth/Login/Presentaion/View/componets/login_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minapharm_task/feature/auth/Signup/Presentaion/view/signup_screen.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

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
                  widget: const SignUpScreen(), context: context),
              child: Text(
                'SignUp',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ProgressButton.icon(iconedButtons: {
              ButtonState.idle: IconedButton(
                  text: "Login",
                  icon: const Icon(Icons.send, color: Colors.white),
                  color: Colors.black),
              ButtonState.loading: IconedButton(
                  text: "Loading", color: Colors.deepPurple.shade700),
              ButtonState.fail: IconedButton(
                  text: "Failed",
                  icon: const Icon(Icons.cancel, color: Colors.white),
                  color: Colors.red.shade300),
              ButtonState.success: IconedButton(
                  text: "Success",
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                  color: Colors.green.shade400)
            }, onPressed: () {}, state: ButtonState.idle)
          ],
        ),
      ),
    );
  }
}
