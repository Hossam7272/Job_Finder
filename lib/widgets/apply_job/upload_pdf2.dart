import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/apply_controller.dart';
import 'package:job_finder/controller/profile_controller.dart';

class UploadPDF2 extends StatelessWidget {
  const UploadPDF2({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return SizedBox(
        height: 30,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(child: SvgPicture.asset('assets/img/pdf.svg')),
            Expanded(
                flex: 7,
                child: Text(controller.basename1!)
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.edit,color: AppColors.myblue500),
                onPressed: (){
                  controller.uploadCV();
                },
              ),
            ),
            Expanded(
              child: IconButton(
                  icon: const Icon(Icons.dangerous_outlined,color: AppColors.myred,),
                  onPressed: (){
                  }
              ),
            )
          ],
        )
    );
  }
}
