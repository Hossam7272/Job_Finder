import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:job_finder/controller/apply_controller.dart';
import 'package:job_finder/controller/home_controller.dart';
import 'package:job_finder/widgets/apply_job/my_circle.dart';
import 'package:job_finder/widgets/page_view/biodata_container.dart';
import 'package:job_finder/widgets/page_view/typework_container.dart';

import '../widgets/page_view/upload_protofiolo_conatiner.dart';

class ApplyJob extends StatelessWidget {
  const ApplyJob({super.key});

  @override
  Widget build(BuildContext context) {
    ApplyController controller = Get.put(ApplyController());
    HomeController controller2 = Get.find();
    int id = controller2.current_index;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Apply Job'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ApplyController>(builder: (controller){
              return Row(
                children: [
                  Expanded(
                      child: MyCircle(
                          mycolor: Colors.white ,
                          subtxt: 'Biodata',
                          child: SvgPicture.asset('assets/img/tick-circle.svg',height: MediaQuery.of(context).size.height,)
                      )
                  ),
                  Expanded(
                      child: MyCircle(
                        mycolor: controller.page_value != 0 ? Colors.white : Colors.black,
                        subtxt: 'Type of work',
                        child: controller.page_value != 0 ? SvgPicture.asset('assets/img/tick-circle.svg',height: MediaQuery.of(context).size.height,) : const Text('2') ,
                      )),
                  Expanded(
                      child: MyCircle(
                        mycolor: controller.page_value == 2 ? Colors.white : Colors.black,
                        subtxt: 'Upload portfolio',
                        child: controller.page_value == 2 ? SvgPicture.asset('assets/img/tick-circle.svg',height: MediaQuery.of(context).size.height) : const Text('3') ,
                      ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 20,),
            SizedBox(
              height: 600,
              child: PageView(
                controller: controller.pcon,
                onPageChanged: (val){
                  controller.changePage(val);
                },
                children: [
                  BioContainer(onPressed: (){
                    controller.pcon.jumpToPage(1);
                  }, phonecon: controller.phonecon,),
                  TypeWorkContainer(onPressed: (){
                    controller.pcon.jumpToPage(2);
                  },),
                  UplaodprotofoloContainer(onPressed: (){
                    controller.applyJob(id);
                  },),
        
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
