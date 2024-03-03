import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/profile_controller.dart';
import 'package:job_finder/widgets/mybtn.dart';
import 'package:job_finder/widgets/myform.dart';

class ChangePhone extends StatelessWidget {
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController con = TextEditingController();
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Phone number'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Main phone number'),
            subtitle: MyForm(text: '0123123',con: con,),
          ),

          GetBuilder<ProfileController>(builder: (controller){
            return ListTile(
              title: const Text('Use the phone number to reset your password'),
              trailing: Switch(
                value: controller.isSwitchedphone,
                onChanged: (val){
                  controller.switchItphone();
                },
              ),
            );
          }),
          Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(title: MyBtn(text: "Save",onPressed: (){},)),
              )
          )
        ],
      ),

    );
  }
}
