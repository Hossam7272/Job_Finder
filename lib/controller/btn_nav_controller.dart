import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_finder/view/applied.dart';
import 'package:job_finder/view/home.dart';
import 'package:job_finder/view/mssgs.dart';
import 'package:job_finder/view/profile/profile.dart';
import 'package:job_finder/view/saved.dart';

class BtnNavController extends GetxController{
  int currentIndex = 0;
  List<Widget> options = [
    Home(),
    Mssgs(),
    Applied(),
    Saved(),
    Profile()
  ];

  ONChange(int value){
    currentIndex = value;
    update();
  }
}