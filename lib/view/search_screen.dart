import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/home_controller.dart';
import 'package:job_finder/widgets/search_form.dart';

class SearchScreen extends StatelessWidget {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  SearchForm(
          con: controller.searchcon,
          onTap: (){
            controller.searchJobsName();
            FocusScope.of(context).unfocus();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            decoration: const BoxDecoration(
              color: AppColors.mygray100
            ),
            child: const ListTile(title: Text('History Searches',style: TextStyle(fontWeight: FontWeight.w500),)),
          )
        ],
      ),
    );
  }
}
