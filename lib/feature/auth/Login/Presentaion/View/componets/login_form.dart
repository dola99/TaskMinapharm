import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minapharm_task/widgets/custom_textfield.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final formKey = GlobalKey<FormState>();
  final bool _isPasswordShowen = false;
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
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
      ],
    );
  }
}
