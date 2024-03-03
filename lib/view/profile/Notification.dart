import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/profile_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notification'),
      ),
      body: ListView(
        children: [
          Container(
            color: AppColors.mygray300,
              child: const ListTile(
                title: Text('Job notification'),
              )
          ),
          GetBuilder<ProfileController>(builder: (controller){
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,i){
                    return ListTile(
                      title: Text('${controller.settings[i]}') ,
                      trailing: Switch(
                        value: controller.isSwitched[i],
                        onChanged: (value){
                          controller.switchIt(i);
                        },
                      ),

                    );
                  }),
            );
          }),
          Container(
            color: AppColors.mygray300,
              child: const ListTile(
                title: Text('Other notification'),
              )
          ),
          GetBuilder<ProfileController>(builder: (controller){
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context,i){
                    return ListTile(
                      title: Text('${controller.settings[i+5]}') ,
                      trailing: Switch(
                        value: controller.isSwitched[i+5],
                        onChanged: (value){
                          controller.switchIt(i+5);
                        },
                      ),

                    );
                  }),
            );
          }),

        ],
      )


    );
  }
}
