import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/auth/login_controller.dart';
import 'package:job_finder/main.dart';
import 'package:job_finder/widgets/mybtn.dart';
import 'package:job_finder/widgets/myform.dart';

import '../../functions/validation.dart';

class ForgotPass extends StatelessWidget {
  const ForgotPass({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: SvgPicture.asset('assets/img/Logo.svg'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            title: Text('Create new password',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            subtitle: Text('Set your new password so you can login and acces Jobsque'),
          ),
          GetBuilder<LoginController>(builder: (controller)=>MyForm(
            con: controller.newpasscon1,
            text: 'password',
            obscure: controller.newPassobscure,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon:  IconButton(
                onPressed: (){
                  controller.showNewpass();
                },
                icon: controller.newPassobscure == true ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
            ),
            validator: (val){
              return validUser(val!, 'password');
            },
          ),),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Password must be at least 8 characters',style: TextStyle(color: AppColors.mygray400),),
          ),
          GetBuilder<LoginController>(builder: (controller)=>MyForm(
            con: controller.newpasscon2,
            text: 'password',
            obscure: controller.newPass2obscure,
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon:  IconButton(
                onPressed: (){
                  controller.showNewpass2();
                },
                icon: controller.obscure == true ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
            ),
            validator: (val){
              return validUser(val!, 'password');
            },
          ),),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Both password must match',style: TextStyle(color: AppColors.mygray400),),
          ),


          const Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You remember your password',style: TextStyle(color: AppColors.mygray400,fontSize: 14),),
                    Text(' Login',style: TextStyle(color: AppColors.myblue500,fontSize: 14),)
                  ],
                ),
            )
          ),
          const SizedBox(height: 10,),
          ListTile(
            title: MyBtn(
              onPressed: (){
                controller.resetPass();
              },
              text: 'Reset password',
          ),
        ),


        ],
      ),
    );
  }
}
