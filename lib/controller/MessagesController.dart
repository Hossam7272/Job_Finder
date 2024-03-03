import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_finder/api/connect.dart';
import 'package:job_finder/const/api_links.dart';
import 'package:job_finder/main.dart';

class MessagesController extends GetxController{
  Connect con = Connect();
  TextEditingController searchCon = TextEditingController();
  TextEditingController mssgCon = TextEditingController();
  List MessagesList = [];
  List companyList = [];
  goToMessages({int? index})async{
    await getCompanyMessgs('$index');
    Get.toNamed('/mssg_page',arguments: {'index' : index});
  }
  showComapany()async{
    var r = await con.getMyData(url: APILinks.company_link);
    companyList.addAll(r['data']);
  }
  getMessages()async{
    await showComapany();
    for(int i=0;i<companyList.length;i++){
      var r = await con.getMyData(url: APILinks.message_link,map: {
        'user_id' : savey.getString('id'),
        'comp_id' : '${companyList[i]['id']}'
      });
      if(r['status'] == true){
        MessagesList.addAll(r['data']);
      }else{
        print('error');
      }
    }
    update();
  }
  RxList compMssgList = [].obs;
  getCompanyMessgs(String id)async{
    var r = await con.getMyData(url: APILinks.message_link, map: {
      'user_id' : savey.getString('id'),
      'comp_id' : id
    });
    compMssgList.value.addAll(r['data']);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMessages();
  }
}
