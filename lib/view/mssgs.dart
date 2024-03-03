import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/widgets/search_form.dart';

import '../controller/MessagesController.dart';

class Mssgs extends StatelessWidget {
  const Mssgs({super.key});

  @override
  Widget build(BuildContext context) {
    MessagesController controller = Get.put(MessagesController());
    return Scaffold(
      appBar: AppBar(title: const Text('Messages'),),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            child: ListTile(
              title: SearchForm(con: controller.searchCon,),
              trailing: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                    child: SvgPicture.asset('assets/img/setting-4.svg')
                ),
              ),

            ),
          ),
          Container(
            color: AppColors.mygray100,
            height: MediaQuery.of(context).size.height * 0.07,
            child: const ListTile(
              title: Text('Unread'),
              trailing: Text('Read all messages',style: TextStyle(color: AppColors.myblue500,fontSize: 15),),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: GetBuilder<MessagesController>(builder: (controller){
              return ListTile(
                title: controller.MessagesList.isEmpty ?

                Center(child: Text('There are no messages'),
                ) : ListView.builder(
                    itemCount: controller.companyList.length,
                    itemBuilder: (context,i){
                      return Material(
                        elevation: 1,
                        child: InkWell(
                          onTap: (){
                            controller.goToMessages(index: controller.companyList[i]['id']);
                          },
                          child: ListTile(
                            title:  Text('${controller.companyList[i]['name']}'),
                            leading: Image.asset('assets/img/Dana Logo.png'),
                            subtitle: Text('${controller.MessagesList[i]['massage']}'),
                            trailing: const Text('12:33',style: TextStyle(color: AppColors.myblue500,fontSize: 15),),
                          ),
                        ),
                      );

                    }),
              );
            },)
          )


        ],
      ),
    );
  }
}
