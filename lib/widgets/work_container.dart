import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/apply_controller.dart';

class WorkContainer extends StatelessWidget {
  String? text;
  WorkContainer({super.key,this.text});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApplyController>(
      init: ApplyController(),
        builder: (controller){

      return Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side:  BorderSide(width: 1,color: controller.groupWork == '$text' ? AppColors.myblue500 : Colors.black)
              ),
              color: controller.groupWork == '$text' ? AppColors.myblue2 : Colors.white
          ),
          child: Column(
            children: [
              ListTile(
                title: Text('$text'),
                subtitle: const Text('CV.pdf . Portfolio.pdf'),
                trailing: Radio(groupValue: controller.groupWork ,value: text ,onChanged: (val){
                  controller.checkRadio('$text');
                },),

              )
            ],
          )

      );
    });
  }
}
