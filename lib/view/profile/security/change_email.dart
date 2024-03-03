import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/profile_controller.dart';
import 'package:job_finder/widgets/mybtn.dart';
import 'package:job_finder/widgets/myform.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController con = TextEditingController();
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Email Address'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Main e-mail address'),
            subtitle: MyForm(text: '${controller.profile[0]['email']}',con: con,),
          ),
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
