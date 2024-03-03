import 'dart:io';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_finder/api/connect.dart';
import 'package:job_finder/const/api_links.dart';

import '../main.dart';

class ProfileController extends GetxController{
  Connect con = Connect();
  TextEditingController biocon = TextEditingController();
  TextEditingController addresscon = TextEditingController();
  TextEditingController mobilecon = TextEditingController();
  List general = ['Edit Profile','Portfolio','Language','Notification','Login and security'];
  List others = ['Accesibility','Help Center','Terms & Conditions','Privacy Policy'];
  List imgs = ['profile.svg','Frame_camera.svg','Frame_lan.svg','Frame_notification.svg','Frame_lock.svg'];
  List Functions = [
        (){Get.toNamed('/edit_profile');},
        (){Get.toNamed('/protifolo');},
        (){Get.toNamed('/language');},
        (){Get.toNamed('/Notification');},
        (){Get.toNamed('/security');},
  ];
  List FunctionsOthers = [
    (){Get.toNamed('/accessibility');},
    (){Get.toNamed('/help_center');},
    (){Get.toNamed('/terms');},
    (){Get.toNamed('/privacy');},
  ];
  List profile = [];

  final picker = ImagePicker();
  File? myfile;
  chagePhoto()async{
    XFile? camera = await picker.pickImage(source: ImageSource.camera);
    myfile = File(camera!.path);

  }
  editProfile()async{
    var r = await con.putData(APILinks.edit_link, {
      'bio' : biocon.text,
      'address' : addresscon.text,
      'mobile' : mobilecon.text
    });
  }
  GetProfile()async{
    var r = await con.getMyData(url: APILinks.profile_link);
    profile.add(r['data']);
    update();
  }
  List portofolio = [];
  getPortofolio()async{
    var r = await con.getData(url: APILinks.get_protofolio);
    portofolio.addAll(r['data']['portfolio']);
    update();
  }
  late File file;
  String? basename1;
  bool? upload = false;
  uploadCV()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
      basename1 = basename(file.path);
      upload = true;
      await con.getfile2(APILinks.add_protofolio, file);
    } else {
      Get.defaultDialog(
          middleText: 'please upload your CV'
      );
    }
    update();
  }
  //--------------------------language page-------------------------
  String? gvalue;
  List lan = ['English', 'Indonesia','Arabic','Chinese','Dutch','German','Japanese','Korean','Portuguese'];
  List lanImg = ['England.png', 'Indonesia.png','Saudi Arabia.png','China.png','Netherlands.png','Germany.png','Japan.png','South Korea.png','Portugal.png'];
  changeLan(String val)async{
    gvalue = val;
    await con.putData(APILinks.edit_link, {
        'language' : val,
      });

    update();
  }
  //--------------------------notify page-------------------------
  List<bool> isSwitched = [false,false,false,false,false,false,false,false];
  List<String> settings = ['Your Job Search Alert','Job Application Update','Job Application Reminders','Jobs You May Be Interested In','Job Seeker Updates','Show Profile','All Message','Message Nudges'];
  switchIt(int index){
    isSwitched[index] = !isSwitched[index];
    update();
  }
  //--------------------change phone----------------------------
  bool isSwitchedphone = false;
  switchItphone(){
    isSwitchedphone = !isSwitchedphone;
    update();
  }

  //-------------helping center-----------------------------------
  TextEditingController conHelp = TextEditingController();
  List<bool> show = [false,false,false,false,false,false];
  notShow(int i)async{
    show[i] = !show[i];
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetProfile();
    getPortofolio();
  }
}