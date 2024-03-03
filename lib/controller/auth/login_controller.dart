import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/api_links.dart';
import 'package:job_finder/main.dart';

import '../../api/connect.dart';

class LoginController extends GetxController{
  late TextEditingController emailcon;
  late TextEditingController passcon;
  late TextEditingController newpasscon1 = TextEditingController();
  late TextEditingController newpasscon2 = TextEditingController();
  bool obscure = true;
  bool newPassobscure = true;
  bool newPass2obscure = true;
  GlobalKey<FormState> gk = GlobalKey();
  Connect con = Connect();

  GotoRegister(){
    Get.offNamed('/signup');
  }
  showpass(){
    obscure = !obscure;
    update();
  }
  showNewpass(){
    newPassobscure = !newPassobscure;
    update();
  }
  showNewpass2(){
    newPass2obscure = !newPass2obscure;
    update();
  }
  Login()async{
   if(gk.currentState!.validate()){
     var r = await con.postData(
         APILinks.login_link,
         {
       'email' : emailcon.text,
       'password' : passcon.text
         }
     );
     if(r['status'] == true){
       savey.setString('token', r['token']);
       savey.setString('username', r['user']['name']);
       savey.setString('email', r['user']['email']);
       savey.setString('id', r['user']['id'].toString());
       Get.offNamed('/home');

     }else{
       print(r['status']);
       print(emailcon.text);
       print(passcon.text);
       print('no');
       Get.defaultDialog(
           middleText: 'Wrong Password or email'
         );
     }
   }
  }

  //---------------reset pass----------------------
  TextEditingController resetcon = TextEditingController();
  resetPass()async{
    if(newpasscon1.text == newpasscon2.text){
      var r = await con.postDatawithtoken(map: {
        'password' : newpasscon1.text
      },url: APILinks.newPasslink);
      if(r['status'] == true){
        Get.offNamed('/success_reset');
      }
    }else{
      Get.defaultDialog(
        middleText: 'Password not match'
      );
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailcon = TextEditingController();
    passcon = TextEditingController();
  }
}