import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/auth/signup_controller.dart';
import 'package:job_finder/functions/validation.dart';
import 'package:job_finder/widgets/mybtn.dart';
import 'package:job_finder/widgets/myform.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: SvgPicture.asset('assets/img/Logo.svg'),
          ),
        ],
      ),
      body: Form(
        key: controller.gk,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: const ListTile(
                title: Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                subtitle: Text('Please create an account to find your dream job'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
                child: Column(
              children: [
                MyForm(con: controller.usercon,text: 'username',prefixIcon: const Icon(Icons.perm_identity),validator: (val){return validUser(val!, 'username');},),
                MyForm(con: controller.emailcon,text: 'email',prefixIcon: const Icon(Icons.email_outlined),validator: (val){return validUser(val!, 'email');}),
                GetBuilder<SignUpController>(builder: (controller)=>MyForm(
                  con: controller.passcon,
                  text: 'password',
                  obscure: controller.obscure,
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon:  IconButton(
                    onPressed: (){
                      controller.showpass();
                    },
                      icon: controller.obscure == true ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility)
                  ),
                  subtitle:  Text(
                    'Password must be at least 8 characters',style: TextStyle(color: controller.shortPass == false ? AppColors.mygray400 : AppColors.myred),
                  ),
                  validator: (val){
                    if(validUser(val!, 'password') == false){
                      controller.isShortPass();
                    }else{
                      controller.istShortPass();
                      return validUser(val!, 'password');
                    }
                    },
                ),)
              ],
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
                child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(child: const Text(' Login',style: TextStyle(color: AppColors.myblue500),),onPressed: (){
                        controller.GotoLogin();
                      }),
                  ],
                ),
                ListTile(
                    title: MyBtn (
                      type: false,
                      text: 'Create account',onPressed: ()async{
                      await controller.createAccount();
                      //Get.to(MyWork());
                    },
                    ),

                  ),
                const Center(child: Text('Or Sign up With Account')),
                ListTile(
                  title: InkWell(child: SvgPicture.asset('assets/img/Button.svg'),onTap:(){

                  },),
                  trailing: InkWell(child: SvgPicture.asset('assets/img/Button-1.svg'),onTap: (){

                  },),
                ),
              ],
            ))


          ],
        ),
      ),
    );
  }
}
