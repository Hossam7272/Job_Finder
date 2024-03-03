import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/apply_controller.dart';
import 'package:job_finder/controller/home_controller.dart';
import 'package:job_finder/view/home.dart';
import 'package:job_finder/widgets/mybtn.dart';

class JobApplied extends StatelessWidget {
  const JobApplied({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                  child: SvgPicture.asset('assets/img/jobApplied.svg'))),
          const Expanded(
            child: Align(
              alignment: FractionalOffset.center,
              child: ListTile(
                  title: Text('Your data has been successfully sent',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  subtitle: Text('You will get a message from our team, about the announcement of employee acceptance'),
              ),
            ),
          ),
        Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                    title: MyBtn(text: 'Back to home',onPressed: (){
                      controller.work = true;
                      print(controller.current_index);
                      Get.toNamed('/home');
                },))))
        ],
      ),
    );
  }
}
