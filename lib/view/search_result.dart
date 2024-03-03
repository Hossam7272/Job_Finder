import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/model/job_model.dart';
import 'package:job_finder/controller/home_controller.dart';
import 'package:job_finder/widgets/recentJobs.dart';
import 'package:job_finder/widgets/search_form.dart';

class SearchResult extends StatelessWidget {
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  SearchForm(con: controller.searchcon,onTap: (){
          FocusScope.of(context).unfocus();
          controller.searchJobsName();}),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: (){
                        Get.toNamed('/filter_page');
                      },
                      icon: const Icon(Icons.filter_list)
                  ),
                  GetBuilder<HomeController>(builder: (controller)=>
                     Container(
                       padding: const EdgeInsets.symmetric(horizontal: 15),
                       decoration: ShapeDecoration(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(100)
                         ),
                         color: AppColors.myblue900
                       ),
                       child: DropdownButton(
                         dropdownColor: AppColors.myblue900,
                         style: const TextStyle(color: Colors.white),
                         underline: const Divider(thickness: 0,color: AppColors.myblue900,),
                            hint: const Text('job type',style: TextStyle(color: Colors.white),),
                            items: ['Full Time','Part Time','Contract','Onsite','Internship'].map((e) => DropdownMenuItem(value: e,child: Text('$e'),)).toList(),
                            onChanged: (val){
                              controller.changeSelectedJobType(val!);
                              },
                            value: controller.selectedJobType,
                          ),
                     ),
                  ),
                  GetBuilder<HomeController>(builder: (controller)=>
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            color: AppColors.myblue900
                        ),
                        child: DropdownButton(
                          dropdownColor: AppColors.myblue900,
                          style: const TextStyle(color: Colors.white),
                          underline: const Divider(thickness: 0,color: AppColors.myblue900,),
                          hint: const Text('Post date',style: TextStyle(color: Colors.white),),
                          items: ['oldest','newest'].map((e) => DropdownMenuItem(value: e,child: Text('$e'),)).toList(),
                          onChanged: (val){
                            controller.changeSelectedJobType2(val!);
                          },
                          value: controller.selectedJobType2,
                        ),
                      ),
                  ),
                ],
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.mygray100
              ),
              child: const ListTile(title: Text('Featuring 120+ jobs',style: TextStyle(fontWeight: FontWeight.w500),)),
            ),
          ),
          Expanded(
            flex: 12,
            child: GetBuilder<HomeController>(
              builder: (controller){
                if(controller.searhResult.isEmpty){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/img/Search Ilustration.svg'),
                      const ListTile(
                        title: Center(child: Text('Search not found',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        subtitle: Center(child: Text('Try searching with different keywords so \n we can show you')),
                      )

                    ],
                  );
                }else{
                  return ListView.builder(
                      itemCount: controller.searhResult.length,
                      itemBuilder: (context,i){
                        return ListTile(title: RecentJobs(jobModel: JobModel.fromJson(controller.searhResult[i])));
                      });

                }
            },),
          )
        ],
      ),
    );
  }
}