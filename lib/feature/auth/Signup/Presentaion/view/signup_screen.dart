import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minapharm_task/feature/auth/Signup/Presentaion/view/componets/signup_form.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
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
              'Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: SignUpForm(),
            ),
            SizedBox(
              height: 25.h,
            ),
            ProgressButton.icon(iconedButtons: {
              ButtonState.idle: IconedButton(
                  text: "SignUp",
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
