import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/profile_controller.dart';

class LangaugePage extends StatelessWidget {
  const LangaugePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Language'),
      ) ,
      body: GetBuilder<ProfileController>(builder: (controller){
        return ListView.builder(
          itemCount: controller.lan.length,
          itemBuilder: (context,i){
            return ListTile(
              title: Text('${controller.lan[i]}'),
              leading: Image.asset('assets/img/${controller.lanImg[i]}'),
              trailing: Radio(
                value: controller.lan[i],
                groupValue: controller.gvalue,
                onChanged: (val){
                  controller.changeLan(val!);

                },
              ),
            );
          },
        );
      },)
    );
  }
}
