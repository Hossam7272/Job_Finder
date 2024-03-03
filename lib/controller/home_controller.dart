import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/api/db.dart';
import 'package:job_finder/const/api_links.dart';
import '../api/connect.dart';
import '../const/mycolors.dart';

class HomeController extends GetxController{
  TextEditingController searchcon = TextEditingController();
  PageController pcon = PageController(initialPage: 0,viewportFraction: 0.9) ;
  PageController pcondetails = PageController(initialPage: 0) ;
  int page_value = 0;
  int pagedetails_value = 0;
  Connect con = Connect();
  bool work = false;
  int current_index = 0;
  String? selectedJobType;
  String? selectedJobType2;

  changeSelectedJobType(String val)async{
    selectedJobType = val;
    var r = await con.postDatawithtoken(url: APILinks.filter_link, map: {'name' : searchcon.text});
    searhResult = [];
    for(int i=0 ; i<r['data'].length;i++){
      if(r['data'][i]['job_time_type'] == val){
        searhResult.add(r['data'][i]);
      }
    }
    update();
  }
  changeSelectedJobType2(String val)async{
    selectedJobType2 = val;
    var r = await con.postDatawithtoken(url: APILinks.filter_link, map: {'name' : searchcon.text});
    searhResult = r['data'];
    searhResult.sort((a,b) {
      var adate = a['created_at'] ;//before -> var adate = a.expiry;
      var bdate = b['created_at'] ;//var bdate = b.expiry;
      return -adate.compareTo(bdate);
    });

    update();
  }

  ChangePage(int val){
    page_value = val;
    update();
  }
  ChangePageDetails(int val){
    pagedetails_value = val;
    update();
  }
  List Alljobs = [];
  getAllJobs()async{
    var r = await con.getMyData(url: APILinks.jobs_link);
    if(r['status'] == true){
      Alljobs.addAll(r['data']);
    }else{
      print('there was an error');
    }
    update();
  }
  Map<String,dynamic> job = {} ;
  getjob(int id){
    job = {};
    for(int i=0 ; i<Alljobs.length ; i++){
      if(Alljobs[i]['id'] == id){
        job = Alljobs[i];
      }
    }
  }
  Map jobApply = {};
  appliedjob(int id){
    jobApply = {};
    for(int i=0 ; i<Alljobs.length ; i++){
      if(Alljobs[i]['id'] == id){
        jobApply = Alljobs[i];
      }
    }
  }
  List searhResult = [];
  searchJobsName()async{
    var r = await con.postDatawithtoken(url: APILinks.filter_link, map: {'name' : searchcon.text});
    if(r['status'] == true){
      searhResult = [];
      searhResult.addAll(r['data']);
      goToSearchResult();
    }else{
      print('error');
    }
    update();

  }

  goToSearch(){
    Get.toNamed('/search_screen');
  }
  goToSearchResult(){
    Get.toNamed('/search_result');
  }
  TextEditingController titlecon = TextEditingController();
  TextEditingController locationcon = TextEditingController();
  TextEditingController salarycon = TextEditingController();
  List filterationList = [];
  filteration()async{
    var r = await con.postDatawithtoken(url: APILinks.filter_link,map:  {
      'salary' : salarycon.text,
      'name' : searchcon.text,
      'location' : locationcon.text,
    });
    searhResult = [];
    searhResult.addAll(r['data']);
    goToSearchResult();
  }

  List<bool> saved = [];
  List iconColor = [];
  Assign(){
    for( int i=0 ; i< Alljobs.length ; i++){
      iconColor.add(Colors.white);
      saved.add(false);
  }
    update();
  }
  SQL sql = SQL();
  List savedJobs = [];
  changeIconColor(int i)async{
   if(saved[i] == false){
     iconColor[i] = AppColors.myblue200;
     saved[i] = true;
     await saveJob(name: '${Alljobs[i]['name']}' , image: '${Alljobs[i]['image']}' , location: '${Alljobs[i]['location']}',companyName: '${Alljobs[i]['comp_name']}');
   }else{
     iconColor[i] = Colors.white;
     saved[i] = false;
     await deleteJob(Alljobs[i]['name']);
     showData();
   }
   update();
  }
  saveJob({String? name, String? companyName, String? location, String? image})async{
    await sql.insert_data("INSERT INTO jobs (name,company_name,location,image,saved) VALUES ('$name','$companyName','$location','$image',1)");
    await showData();
  }
  deleteJob(String name)async{
    await sql.delete_data('DELETE FROM `jobs` WHERE  name = "$name"');
  }
  showData()async{
    savedJobs = [];
    var r = await sql.show_data('SELECT * FROM jobs');
    savedJobs.addAll(r);
  }
  deleteAllData()async{
    sql.delete_database();
  }




  @override
  void onInit() async{
    // TODO: implement onInit
    await getAllJobs();
    await showData();
    Assign();
    super.onInit();

  }
}