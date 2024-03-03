import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/onboarding/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundColor: AppColors.myblue2,
          radius: 88,
          child: SvgPicture.asset('assets/img/Logo.svg'),
        )
      ),
    );
  }
}
