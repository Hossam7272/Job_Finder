import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import '../view/search_screen.dart';

class SearchContainer extends StatelessWidget {
  TextEditingController con = TextEditingController();
  void Function()? onTap;
  SearchContainer({super.key,required this.con,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1,color: AppColors.mygray300),
                borderRadius: BorderRadius.circular(100)
            )
        ),
        child: ListTile(
          title: const Text('Search...',style: TextStyle( fontSize: 14,
              fontFamily: 'SF Pro Display',
              color: AppColors.mygray400,
              fontWeight: FontWeight.w400),),
          leading: SvgPicture.asset('assets/img/search-normal.svg'),
        ),

      ),
    );
  }
}
