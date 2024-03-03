import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/mycolors.dart';

class SkipButton extends StatelessWidget {
  SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      child: const Text('Skip',style: TextStyle(fontSize: 20,color: AppColors.mygray500),),
      onPressed: (){
        Get.offNamed('signup');
      },);
  }
}
