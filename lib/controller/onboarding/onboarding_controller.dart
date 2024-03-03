import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  int currentIndex = 0;

  Change(int index){
    currentIndex = index;
    update();
  }
}