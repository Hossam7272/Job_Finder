import 'package:get/get.dart';
import 'package:job_finder/main.dart';

class SplashScreenController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(const Duration(seconds: 3),(){
      if(savey.getString('username') != null){
        Get.offNamed('/home');
      }else{
        Get.offNamed('/onboarding_screen');
      }
    });
  }
}