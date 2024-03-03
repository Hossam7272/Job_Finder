import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/const/onboarding_data.dart';
import 'package:job_finder/controller/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingController controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: PageView.builder(
                onPageChanged: (int index){
                  controller.Change(index);
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context,i){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Expanded(flex:5,child: onBoardingData[i].img!),
                        Expanded(flex:2,child: onBoardingData[i].title!),
                        Expanded(
                          flex:1,
                          child: GetBuilder<OnBoardingController>(builder: (controller)=>Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                  onBoardingData.length,
                                      (index) => buildDot(index,context)),
                            ],
                          ),)
                        ),
                        ListTile(title: onBoardingData[i].btn!)

                      ],
                    ),
                  );

                }
            ),
          ),
        ],
      ),
    );
  }

  buildDot(int index, BuildContext context) {
    return  AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      duration: const Duration(microseconds: 900),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
          color: controller.currentIndex == index ? AppColors.myblue500 : AppColors.mygray300,
          borderRadius: BorderRadius.circular(10)
      ),
    );

  }
}
