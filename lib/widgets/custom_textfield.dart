import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.isObscure = false,
      this.style,
      this.onChanged,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.onTap,
      this.errorBorder,
      this.suffixIcon,
      this.intialValue,
      this.hintText,
      this.disabledBorder,
      this.hintStyle,
      this.enabledBorder,
      this.prefixIcon,
      this.focusedBorder,
      this.focusedErrorBorder,
      this.textInputType = TextInputType.name,
      this.textEditingController,
      this.focusNode,
      this.inputFormatters});
  final TextInputType textInputType;
  final bool isObscure;
  final TextStyle? style;
  final TextEditingController? textEditingController;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? intialValue;
  final String? Function(String?)? validator;
  final InputBorder? enabledBorder;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isObscure,
      style: style,
      initialValue: intialValue,
      onChanged: onChanged,
      onTap: onTap,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      cursorHeight: 20,
      cursorColor: Theme.of(context).colorScheme.secondary,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIconColor: Colors.green,
        suffixIcon: suffixIcon,
        labelText: hintText,
        prefixIcon: prefixIcon,
        labelStyle: hintStyle,
        filled: true,
        fillColor: Colors.white,
        hintStyle: hintStyle,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        disabledBorder: disabledBorder,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
