import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/widgets/mybtn.dart';

class SuccessReset extends StatelessWidget {
  const SuccessReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: SvgPicture.asset('assets/img/Password Succesfully Ilustration.svg')),
            const Text('Password changed\n        succesfully!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            const ListTile(title: Text('Your password has been changed successfully, we will let you know if there are more problems with your account')),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  title: MyBtn(
                    onPressed: (){
                      Get.offAllNamed('/login');

                    },
                    text: 'Go to login',
                        ),
                      ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
