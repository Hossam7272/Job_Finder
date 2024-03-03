import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/home_controller.dart';
import 'package:job_finder/model/saved_jobs_model.dart';
import 'package:job_finder/widgets/my_saved_jobs.dart';

class Saved extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(centerTitle:true,title: const Text('Saved'),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
            onPressed: (){
              controller.deleteAllData();
            },
          ),
        ],
      ),

      body: ListView(
        children: [
         GetBuilder<HomeController>(
             builder: (controller){
               return Container(
                 padding: const EdgeInsets.all(5),
                 color: AppColors.mygray100,
                 child: Center(child: Text('${controller.savedJobs.length} jobs',style: const TextStyle(fontSize: 19),),),
               );
             }
         ),
          GetBuilder<HomeController>(builder: (controller){
              return SizedBox(
                height: MediaQuery.of(context).size.height ,
                child: controller.savedJobs.isEmpty ?
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/img/Saved Ilustration.svg'),
                    const Text('Nothing has been saved yet',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    const Text('Press the star icon on the job you want to save.')
                  ],
                )  :
                ListTile(
                  title: ListView.builder(
                      itemCount: controller.savedJobs.length,
                      itemBuilder: (context,i){
                        return MySavedJobs(
                          onPressed: (){
                            showModalBottomSheet(context: (context), builder:(context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.3,
                                child: ListView(
                                  children: [
                                    ListTile(
                                      title: Container(
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100),
                                            side: const BorderSide(width: 1,color: AppColors.mygray300)
                                          )
                                        ),
                                        child: ListTile(
                                          title: const Text('Apply Job'),
                                          trailing: IconButton(icon: const Icon(Icons.arrow_forward),onPressed: ()async{
                                            await controller.getjob(controller.savedJobs[i]['id']);
                                            Get.toNamed('/job_details');
                                            //Get.toNamed('/job_details',arguments: {'index' : controller.savedJobs[i]['id']});
                                          },),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Container(
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100),
                                            side: const BorderSide(width: 1,color: AppColors.mygray300)
                                          )
                                        ),
                                        child: ListTile(
                                          title: const Text('Share Via'),
                                          trailing: IconButton(icon: const Icon(Icons.arrow_forward),onPressed: (){},),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Container(
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(100),
                                            side: const BorderSide(width: 1,color: AppColors.mygray300)
                                          )
                                        ),
                                        child: ListTile(
                                          title: const Text('Cancel save'),
                                          trailing: IconButton(icon: const Icon(Icons.arrow_forward),onPressed: (){
                                               controller.deleteJob('${controller.savedJobs[i]['name']}');
                                          },),
                                        ),
                                      ),
                                    ),
                                ],),
                              );
                            });
                          },
                            savedModel: SavedJobsModel.fromJson(controller.savedJobs[i]));
                      }
                  ),
                ),

              );
            }),


          

        ],
      ),
    );
  }
}