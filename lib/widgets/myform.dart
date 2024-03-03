import 'package:flutter/material.dart';

import '../const/mycolors.dart';

class MyForm extends StatelessWidget {
  String? text;
  TextEditingController con = TextEditingController();
  Widget? suffixIcon;
  Widget? prefixIcon;
  Widget? subtitle;
  bool obscure;
  String? Function(String?)? validator;
  MyForm({super.key,this.text,required this.con,this.prefixIcon,this.suffixIcon,this.subtitle,this.validator,this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        validator: validator ,
        controller: con,
        obscureText: obscure,
        decoration: InputDecoration(
            prefixIconColor: AppColors.mygray400,
            suffixIconColor: AppColors.mygray400,
            enabledBorder:  OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.mygray300),
              borderRadius: BorderRadius.circular(15)
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.myblue500),
              borderRadius: BorderRadius.circular(15)
            ),

            labelStyle: const TextStyle(color: AppColors.mygray400),
            prefixStyle: const TextStyle(fontSize: 90),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            label: Text('$text'),

        ),
      ),
      subtitle: subtitle,
    );
  }
}
