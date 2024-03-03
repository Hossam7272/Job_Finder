import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/view/auth/login.dart';
import 'package:job_finder/widgets/mybtn.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset('assets/img/Success Account Ilustration.svg'),
              SvgPicture.asset('assets/img/Infornation.svg'),
              const Spacer(),
              MyBtn(
                text: 'Get Started',
                onPressed: (){
                  Get.off(Login());
                },
              )



            ],
          ),
        ),
      ),
    );
  }
}
