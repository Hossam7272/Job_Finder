import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/auth/mywork_controller.dart';
import 'package:job_finder/view/auth/signup/success_signup.dart';
import 'package:job_finder/widgets/intersting_jobs.dart';
import 'package:job_finder/widgets/mybtn.dart';

class MyWork extends StatelessWidget {
  const MyWork({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyWorkController());
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 24.0,left: 24,top: 40,bottom: 20),
        child: Column(
          children: [
            const ListTile(
                title:  Text('What type of work are you interested in?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                subtitle:  Text('Tell us what you’re interested in so we can customise the app for your needs.'),
            ),
            const SizedBox(height: 40,),
            Expanded(
              child: Row(
                children: [
                  GetBuilder<MyWorkController>(builder: (controller){
                    print('build1');
                    return InterstingJobs(text: 'UI/UX Designer',img: 'assets/img/bezier.svg',selected: controller.selected1,onTap: (){
                      controller.isSelected1();
                    },);
                  }),
                  const SizedBox(width: 15,),
                  GetBuilder<MyWorkController>(builder: (controller){
                    print('build2');
                    return InterstingJobs(text: 'Ilustrator Designer',img: 'assets/img/pen-tool-2.svg',selected: controller.selected2,onTap: (){
                    controller.isSelected2();
                    },);
                  })
                ],
              ),
            ),
            const SizedBox(height: 15,),
             Expanded(
              child: Row(
                children: [
                  GetBuilder<MyWorkController>(builder: (controller){
                    print('build3');
                    return InterstingJobs(text: 'Developer',img: 'assets/img/code.svg',selected: controller.selected3,onTap: (){
                      controller.isSelected3();
                    },);
                  }),
                  const SizedBox(width: 15,),
                  GetBuilder<MyWorkController>(builder: (controller){
                    print('build4');
                    return InterstingJobs(text: 'Management',img:'assets/img/graph.svg' ,selected: controller.selected4,onTap: (){
                      controller.isSelected4();
                    },);

                  })
                ],
              ),
            ),
            const SizedBox(height: 15,),
             Expanded(
              child: Row(
                children: [
                  GetBuilder<MyWorkController>(builder: (controller){
                    print('build5');
                    return InterstingJobs(text: 'Information Technology',img: 'assets/img/monitor-mobbile.svg',selected: controller.selected5,onTap: (){
                      controller.isSelected5();
                    },);

                  }),
                  const SizedBox(width: 15,),
                  GetBuilder<MyWorkController>(builder: (controller){
                    print('build6');
                    return InterstingJobs(text: 'Research and Analytics',img: 'assets/img/cloud-add.svg',selected: controller.selected6,onTap: (){
                      controller.isSelected6();
                    },);
                  })
                ],
              ),
            ),
            const SizedBox(height: 60,),
            MyBtn(onPressed: (){
              Get.off(SuccessSignup());
            },text: 'Next',)

          ],
        ),
      ),
    );
  }
}
