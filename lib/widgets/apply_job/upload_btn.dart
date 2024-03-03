import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/apply_controller.dart';

import '../../const/mycolors.dart';

class UploadBtn extends StatelessWidget {
  const UploadBtn({super.key});

  @override
  Widget build(BuildContext context) {
    ApplyController controller = Get.put(ApplyController());
    return TextButton(
      child: const Text('Click here to upload to CV',style: TextStyle(color: AppColors.mygray300),),
      onPressed: (){
        controller.uploadCV();
      },
    );
  }
}
