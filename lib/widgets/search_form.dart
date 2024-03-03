import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/home_controller.dart';
import '../const/mycolors.dart';

class SearchForm extends StatelessWidget {
  void Function()? onTap;
  TextEditingController con = TextEditingController();
  SearchForm({super.key,this.onTap,required this.con});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: con ,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          hintText: 'Type something...',
          hintStyle: const TextStyle( fontSize: 14,
              fontFamily: 'SF Pro Display',
              color: AppColors.mygray400,
              fontWeight: FontWeight.w400
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap:onTap,
              child: SvgPicture.asset('assets/img/search-normal.svg',width: 40,height: 40,)),
          ),
        ),
        ),
    );

  }
}
