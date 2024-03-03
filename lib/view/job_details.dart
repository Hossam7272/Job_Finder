import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/model/job_model.dart';
import 'package:job_finder/controller/home_controller.dart';
import 'package:job_finder/widgets/page_view/company_conatiner.dart';
import 'package:job_finder/widgets/page_view/description_container.dart';
import 'package:job_finder/widgets/mybtn.dart';

class JobDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Job Detail'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
          ),
          IconButton(onPressed: (){
            Get.offAllNamed('/login');
          }, icon: const Icon(Icons.exit_to_app))
        ],

      ),
      body: ListView(
          children: [
            ListTile(title: Image.network('${controller.job['image']}',width: 50,height: 50,)),
            ListTile(title: Center(child: Text('${controller.job['name']}',style: const TextStyle(fontSize: 20),))),
            ListTile(
              title: Row(
                children: [
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    decoration: ShapeDecoration(
                      color: AppColors.myblue2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      '${controller.job['job_time_type']}',
                      style: const TextStyle(
                        color: AppColors.myblue500,
                        fontSize: 12,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),),
                  const SizedBox(width: 20,),
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    decoration: ShapeDecoration(
                      color: AppColors.myblue2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      '${controller.job['job_type']}',
                      style: const TextStyle(
                        color: AppColors.myblue500,
                        fontSize: 12,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ),),
                ],
              ),
            ),
            //--------------------------------------button company and description---------------------------------------
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                    color: AppColors.mygray100,
                    borderRadius: BorderRadius.circular(100)
                ),
                child: GetBuilder<HomeController>(
                  builder: (controller){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Center(
                          child: InkWell(
                            onTap:(){
                              controller.pcondetails.jumpToPage(0);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width ,
                              height:45 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: controller.pagedetails_value == 0 ? AppColors.myblue900 : AppColors.mygray100,
                              ),
                              alignment: Alignment.center,
                              child: Text('Description',style: TextStyle(color: controller.pagedetails_value == 0 ? Colors.white : AppColors.mygray500),),
                            ),
                          ),
                        )),
                        Expanded(child: Center(
                          child: InkWell(
                            onTap:(){
                              controller.pcondetails.jumpToPage(1);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width ,
                              height:45 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: controller.pagedetails_value == 1 ? AppColors.myblue900 : AppColors.mygray100,
                              ),
                              alignment: Alignment.center,
                              child: Text('Company',style: TextStyle(color: controller.pagedetails_value == 1 ? Colors.white : AppColors.mygray500),),
                            ),
                          ),
                        )),
                      ],
                    );
                  },
                )
              ),
            ),
            //-------------------------page view--------------------------------------------
            ListTile(
              title: SizedBox(
                height: 400,
                child: PageView(
                  controller: controller.pcondetails,
                  onPageChanged: (val){
                    controller.ChangePageDetails(val);
                  },
                  children: [
                    DescriptionContainer(model: JobModel.fromJson(controller.job)),
                    CompanyContainer(model: JobModel.fromJson(controller.job)),
                  ],
                ),
              ),
            ),
            //-----------------------------button Apply------------------------------------------------------------
            ListTile(
              title: MyBtn(text: 'Apply now',onPressed: (){
                Get.toNamed('/apply_job');
              },),
            )




          ],
        ),



    );
  }
}
