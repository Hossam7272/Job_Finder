import 'package:get/get.dart';

class MyWorkController extends GetxController{
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;
  bool selected7 = false;
  bool selected8 = false;

  isSelected1(){
    selected1 = !selected1;
    update();
  }
  isSelected2(){
    selected2 = !selected2;
    update();
  }
  isSelected3(){
    selected3 = !selected3;
    update();
  }
  isSelected4(){
    selected4 = !selected4;
    update();
  }
  isSelected5(){
    selected5 = !selected5;
    update();
  }
  isSelected6(){
    selected6 = !selected6;
    update();
  }
}