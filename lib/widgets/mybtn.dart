import 'package:flutter/material.dart';
import 'package:job_finder/const/mycolors.dart';

class MyBtn extends StatelessWidget {
  void Function()? onPressed;
  String? text;
  bool? type = true;
  MyBtn({super.key,this.onPressed,this.text,this.type = true});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
          ),
          child:  ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: type == true ? AppColors.myblue500 : AppColors.mygray300,
            ),
            onPressed: onPressed,
            child: Text('$text',style:  TextStyle(color: type == true ? Colors.white : AppColors.mygray500),),

          ),
        );


  }
}
