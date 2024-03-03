import 'dart:io';
import 'package:job_finder/const/api_links.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../api/connect.dart';
import '../main.dart';

class ApplyController extends GetxController{
  PageController pcon = PageController(initialPage: 0);
  TextEditingController phonecon = TextEditingController();
  String? groupWork;
  late File otherfile;
  late File file ;
  late String basename1;
  bool upload = false;
  int? current_index;

  int page_value = 0;

  changePage(int val){
    page_value = val;
    update();
  }
  changeUpload(){
    upload = false;
    update();
  }
  uploadCV()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
      basename1 = basename(file.path);
      upload = true;
    } else {
      Get.defaultDialog(
          middleText: 'please upload your CV'
      );
    }
    update();
  }

  checkRadio(String text){
    groupWork = text;
    update();
  }
  Connect con = Connect();
  applyJob(int id) async{
    await con.getfile(APILinks.apply_link, {
      'name' : savey.getString('username'),
      'email' :savey.getString('email'),
      'mobile' : phonecon.text,
      'work_type' : 'full',
      'other_file' : otherfile ,
      'user_id' : savey.getString('id'),
      'jobs_id' : id.toString()
    }, file,otherfile
    );
    Get.toNamed('/job_applied');
  }
  //----------------------Applied Page----------------------------------
  PageController controllerApplied = PageController();
  int pageValue = 0;
  ChangePage(int val){
    pageValue = val;
    update();
  }

}
