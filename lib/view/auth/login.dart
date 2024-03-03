import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/auth/login_controller.dart';
import 'package:job_finder/controller/auth/signup_controller.dart';
import 'package:job_finder/functions/validation.dart';
import 'package:job_finder/main.dart';
import 'package:job_finder/widgets/mybtn.dart';
import 'package:job_finder/widgets/myform.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
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
                title: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                subtitle: Text('Please create an account to find your dream job'),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    MyForm(con: controller.emailcon,text: 'email',prefixIcon: const Icon(Icons.perm_identity),validator: (val){return validUser(val!, 'email');},),
                    GetBuilder<LoginController>(builder: (controller)=>MyForm(
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
                      validator: (val){
                       return validUser(val!, 'password');
                      },
                    ),),
                    ListTile(
                      title: const Text('Remember me'),
                      trailing: TextButton(
                        onPressed: (){
                          Get.toNamed('/forgot_pass');
                        },
                        child: const Text('Forgot Password?',style: TextStyle(color: AppColors.myblue500),),
                      ),
                    )
                  ],
                )),
            SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont’t have an account?'),
                        TextButton(child: Text(' Register',style: TextStyle(color: AppColors.myblue500),),onPressed: (){
                          controller.GotoRegister();
                        },),
                      ],
                    ),
                    ListTile(
                      title: MyBtn(type: false,text: 'Login',onPressed: (){
                        controller.Login();

                      }),
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
