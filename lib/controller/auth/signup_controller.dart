import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/api/connect.dart';
import 'package:job_finder/const/api_links.dart';
import 'package:job_finder/view/auth/signup/mywork.dart';

class SignUpController extends GetxController{
  late TextEditingController usercon;
  late TextEditingController emailcon;
  late TextEditingController passcon;
  Connect con = Connect();
  bool obscure = true;
  bool shortPass = false;
  GlobalKey<FormState> gk = GlobalKey();





  GotoLogin(){
    Get.offNamed('/login');
  }

  isShortPass(){
    shortPass = true;
    update();
  }
  istShortPass(){
    shortPass = false;
    update();
  }
  showpass(){
    obscure = !obscure;
    update();
  }

  createAccount()async{
    if(gk.currentState!.validate()){
      var r = await con.CreateAccount(APILinks.signup_link, {
        'name' : usercon.text,
        'email' : emailcon.text,
        'password' : passcon.text
      },'434|Dfm65OUDf601rNKg2wDW3MIyfH7VNIiizKJJslWA');
    if(r['status'] == true){
      print('yes');
      Get.off( ()=> MyWork());
    }else{
      print('no');
    }
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usercon = TextEditingController();
    emailcon = TextEditingController();
    passcon = TextEditingController();
  }

}
