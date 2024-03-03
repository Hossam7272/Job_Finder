import 'package:flutter/material.dart';
import 'package:job_finder/const/mycolors.dart';

class SenderCon extends StatelessWidget {
  String? txt;
  SenderCon({super.key,this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 15),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: AppColors.myblue500
      ),
      child: Text('$txt',style: const TextStyle(color: Colors.white),),
    );
  }
}
