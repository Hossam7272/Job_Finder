import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/const/mycolors.dart';

class InterstingJobs extends StatelessWidget {
  String? text;
  String? img;
  void Function()? onTap;
  bool selected ;
  InterstingJobs({super.key,this.text,this.img,this.onTap,this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: InkWell(
          onTap: onTap,
          child: Material(
              borderRadius: BorderRadius.circular(12),
              color: selected == false ? Colors.white : AppColors.myblue2  ,
              elevation: 2,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: selected == false ? AppColors.mygray300 : AppColors.myblue500,
                      radius: 30,
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: Colors.white,
                          child: SvgPicture.asset('$img',color: AppColors.mygray500,)
                      )
                  ),
                  Center(child: Text('$text'))
                ],
              ),

            ),
        ),


    );
  }
}
