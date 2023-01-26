import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minapharm_task/core/route/navigation.dart';
import 'package:minapharm_task/feature/auth/Presentaion/Cubit/login_cubit.dart';
import 'package:minapharm_task/feature/auth/Presentaion/Cubit/login_states.dart';
import 'package:minapharm_task/feature/home/Movie/Presentaion/view/home_screen.dart';
import 'package:minapharm_task/widgets/custom_textfield.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final formKey = GlobalKey<FormState>();
  final bool _isPasswordShowen = false;
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var buttonState = ButtonState.idle;
    return Column(
      children: [
        CustomTextField(
          textEditingController: userNameController,
          focusNode: _focusNodes[0],
          hintText: 'userName',
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_focusNodes[1]);
          },
          prefixIcon: Icon(
            Icons.verified_user_rounded,
            color: _focusNodes[0].hasFocus
                ? Theme.of(context).textSelectionTheme.selectionColor
                : Theme.of(context).disabledColor,
          ),
          onSaved: (value) {
            //    LoginCubit.get(context).loginInfo['UserName'] = value;
          },
          hintStyle: TextStyle(
            color: _focusNodes[0].hasFocus
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.shadow,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This Field Is Required';
            }

            return null;
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomTextField(
          textEditingController: passwordController,
          focusNode: _focusNodes[1],
          hintText: 'Password',
          prefixIcon: Icon(
            Icons.password,
            color: _focusNodes[1].hasFocus
                ? Theme.of(context).textSelectionTheme.selectionColor
                : Theme.of(context).disabledColor,
          ),
          isObscure: !_isPasswordShowen,
          suffixIcon: GestureDetector(
            onTap: () {
              // setState(() {
              //   _isPasswordShowen = !_isPasswordShowen;
              // });
            },
            child: Icon(
              _isPasswordShowen
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: _isPasswordShowen
                  ? Theme.of(context).textSelectionTheme.selectionColor
                  : Theme.of(context).disabledColor,
            ),
          ),
          onSaved: (value) {
            //LoginCubit.get(context).loginInfo['Password'] = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'This Field Is Required';
            }

            return null;
          },
          hintStyle: TextStyle(
            color: _focusNodes[1].hasFocus
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.shadow,
            fontFamily: 'oswald',
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccesfully) {
              CustomFunctions.pushScreenRepcalement(
                  widget: const HomeScreen(), context: context);
            }
            if (state is LoginFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(state.errorMsg),
                  ],
                ),
              ));
            }
            switch (state.runtimeType) {
              case LoginFailed:
                buttonState = ButtonState.fail;
                break;
              case LoadingState:
                buttonState = ButtonState.loading;

                break;
              case LoginSuccesfully:
                buttonState = ButtonState.success;

                break;
              default:
            }
          },
          builder: (context, state) {
            return ProgressButton.icon(
                iconedButtons: {
                  ButtonState.idle: const IconedButton(
                      text: "Login",
                      icon: Icon(Icons.send, color: Colors.white),
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
                },
                onPressed: () async {
                  await AuthCubit.get(context)
                      .login(userNameController.text, passwordController.text);
                },
                state: buttonState);
          },
        ),
      ],
    );
  }
}
