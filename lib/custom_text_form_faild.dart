import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.passwordIsVisable = false,
    this.validate,
    this.icon,
    this.icon2,
    this.pill,
    this.suffixIconOnPressed,
  });

  final TextEditingController controller;
  final String? hint;
  final String? label;

  final Widget? pill;
  final IconData? icon;
  final IconData? icon2;
  final VoidCallback? suffixIconOnPressed;
  final bool passwordIsVisable;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.cyan, // Set the color of the border
      validator: validate,
      obscureText: passwordIsVisable,
      style: const TextStyle(
          color: Colors.cyan), // Set the entered text color to teal
      decoration: InputDecoration(
        //suffix: Image.asset( AppAssets.pills,width: 25,height: 25,),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan, // Set the color of the border
            width: 2.0, // Set the width of the border
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan, // Set the border color to white
            width: 2.0, // Set the width of the border
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan, // Set the focused border color to white
            width: 2.0,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.cyan),

        labelText: label,
        labelStyle: const TextStyle(color: Colors.white), icon: pill,
        prefixIcon: Icon(
          icon2,
          color: Colors.cyan, // Set the color of the border
        ),
        suffixIcon: IconButton(
          onPressed: suffixIconOnPressed,
          icon: Icon(icon),
          color: Colors.cyan, // Set the color of the border
        ),
      ),
    );
  }
}
