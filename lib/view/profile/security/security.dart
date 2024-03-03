import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/profile_controller.dart';
import 'package:job_finder/widgets/security/widg_arrow.dart';

import '../../../const/mycolors.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login and security'),
      ),
      body: ListView(
        children: [
          Container(
              color: AppColors.mygray300,
              child: const ListTile(
                title: Text('Account access'),
              )
          ),
          WidgArrow(txt: 'Email address',txt2: '${controller.profile[0]['email']}',onPressed: (){Get.toNamed('change_email');}),
          WidgArrow(txt: 'Phone number',onPressed: (){Get.toNamed('change_phone');},),
          WidgArrow(txt: 'Change password',),
          WidgArrow(txt: 'Two-step verification',txt2: 'Non active',),
          WidgArrow(txt: 'Face ID',),
          // ElevatedButton(onPressed: (){
          //   print('${controller.profile}');
          //   }, child: Text('df'))


        ],
      ),
    );
  }
}
