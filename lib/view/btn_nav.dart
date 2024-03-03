import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/btn_nav_controller.dart';

class ButtonNavigate extends StatelessWidget {
  const ButtonNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BtnNavController());
    return Scaffold(
      body: GetBuilder<BtnNavController>(builder: (controller)=>controller.options.elementAt(controller.currentIndex),),
      bottomNavigationBar: GetBuilder<BtnNavController>(
        init: BtnNavController(),
        builder: (controller){
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset('assets/img/home.svg',color: controller.currentIndex == 0 ? AppColors.myblue500 : AppColors.mygray400,) ,label: 'Home' ),
              BottomNavigationBarItem(icon: SvgPicture.asset('assets/img/message.svg',color: controller.currentIndex == 1 ? AppColors.myblue500 : AppColors.mygray400,) ,label: 'Messages' ),
              BottomNavigationBarItem(icon: SvgPicture.asset('assets/img/applied.svg',color: controller.currentIndex == 2 ? AppColors.myblue500 : AppColors.mygray400,) ,label: 'Applied' ),
              BottomNavigationBarItem(icon: SvgPicture.asset('assets/img/archive-minus.svg',color: controller.currentIndex == 3 ? AppColors.myblue500 : AppColors.mygray400,) ,label: 'Saved' ),
              BottomNavigationBarItem(icon: SvgPicture.asset('assets/img/profile.svg',color: controller.currentIndex == 4 ? AppColors.myblue500 : AppColors.mygray400,) ,label: 'Profile' ),
            ],
            selectedItemColor: AppColors.myblue500,
            unselectedItemColor: AppColors.mygray400,
            currentIndex: controller.currentIndex,
            showUnselectedLabels: true,
            onTap: (value){
              controller.ONChange(value);
            },
          );
        },
      )
    );
  }
}
