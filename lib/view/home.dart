import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/main.dart';
import 'package:job_finder/model/job_model.dart';
import 'package:job_finder/controller/home_controller.dart';
import 'package:job_finder/widgets/mycard_jobs.dart';
import 'package:job_finder/widgets/recentJobs.dart';
import 'package:job_finder/widgets/search_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return SafeArea(
      child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                    title: Text('Hi, ${savey.getString('username')} 👋',
                      style: const TextStyle( fontSize: 24,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500, ),),
                    subtitle: const Text('Create a better future for yourself here',style: TextStyle(fontSize: 12,color: AppColors.mygray500),),
                    trailing: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.mygray300,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.white,
                        child: IconButton(onPressed: (){
                          Get.toNamed('/notification');
                        }, icon: const Icon(Icons.notifications_none)),
                      ),
                    )
                ),
              ),
              Expanded(
                  flex:controller.work == true ? 2 : 1,
                  child: ListTile(title: SearchContainer(con: controller.searchcon,onTap: (){controller.goToSearch();},))),
              controller.work == true ?
              ListTile(
                  title: Container(
                    height: 60,
                    margin: const  EdgeInsets.only(top: 20),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: AppColors.myblue2
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.network('${controller.jobApply['image']}',width: 20,height: 20,)),
                   Expanded(
                     flex: 2,
                       child: Text('${controller.jobApply['name']}')),
                    Expanded(
                      child: Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: AppColors.myblue200
                          ),
                          child: const Center(child: Text('Submited',style: TextStyle(fontSize: 10),)),),
                    )


                  ],
                ),
              ))
              : const Text(''),
              const Expanded(
                flex: 1,
                child:  ListTile(
                  title: Text('Suggested Job',style:  TextStyle(
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500, ),),
                  trailing: Text('View all',style: TextStyle( fontSize: 14, color: AppColors.myblue500),),
                ),
              ),
              Expanded(
                  flex: controller.work == true ? 5 : 4,
                  child: GetBuilder<HomeController>(
                    builder: (controller){
                      return PageView.builder(
                        onPageChanged: (value){
                          controller.ChangePage(value);
                        },
                            controller: controller.pcon,
                            itemCount: controller.Alljobs.length,
                            itemBuilder: (context,i){
                              if(controller.Alljobs.isEmpty && controller.iconColor.isEmpty){
                                return Center(child: Text('there is no data'));
                              }else if(controller.Alljobs.isNotEmpty && controller.iconColor.isNotEmpty){
                                  return MyCardJobs(
                                    onTap: (){
                                      controller.getjob(controller.Alljobs[i]['id']);
                                      controller.current_index = controller.Alljobs[i]['id'];
                                      controller.appliedjob(controller.Alljobs[i]['id']);
                                      Get.toNamed('/job_details');
                                      },
                                    iconPress: (){
                                      controller.changeIconColor(i);
                                    },
                                    jobmodel: JobModel.fromJson(controller.Alljobs[i]),
                                    mycolor: controller.page_value == i ? AppColors.myblue900 : AppColors.mygray300,
                                    iconColor: controller.iconColor[i],
                                  );
                                }
                            }
                              );
                    },
                  )
              ),
              const Expanded(
                flex: 1,
                child:  ListTile(
                  title: Text('Recent Job',style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),),
                  trailing: Text('View all',style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.myblue500
                  ),),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: GetBuilder<HomeController>(
                    builder: (controller){
                      return ListView.builder(
                        itemCount: controller.Alljobs.length,
                        itemBuilder: (context,i){
                          if(controller.Alljobs.isEmpty){
                            return const CircularProgressIndicator();
                          }else{
                            return ListTile(
                              title: RecentJobs(jobModel: JobModel.fromJson(controller.Alljobs[i]),
                              ),
                            );

                          }

                        },
                      );
                    },
                  )

              )

            ],
          ),


    );
  }
}
