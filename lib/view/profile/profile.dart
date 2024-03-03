import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/profile_controller.dart';
import 'package:job_finder/widgets/con_general.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        actions: const [
           Padding(
             padding: EdgeInsets.only(right: 18.0),
             child: Icon(Icons.exit_to_app,color: Colors.red,),
           )
        ],
      ),
      body:ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5,
            child: GetBuilder<ProfileController>(builder: (controller){
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height /5,
                    color: Colors.blue,
                  ),
                  Positioned(   
                    left: 130,
                    top: 60,
                    child: controller.portofolio.isEmpty ?
                    const CircleAvatar(radius: 50,child: Icon(Icons.person,size: 50,),) :
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(controller.portofolio[0]['image']),
                              fit: BoxFit.fill
                          ),
                          color: AppColors.mygray300,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      width: 100,
                      height: 100,
                    ),
                    ),
                ],
              );
            },)
          ),
          GetBuilder<ProfileController>(builder: (context){
            if(controller.profile.isEmpty){
              return const Center(child: Text('',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),));
            }else{
              return Center(child: Text('${controller.profile[0]['name']}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),));
            }
          }),
          const Center(child: Text('')),
          const Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Applied'),
                    subtitle: Center(child: Text('33',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Reviewed'),
                    subtitle: Center(child: Text('33',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Contact'),
                    subtitle: Center(child: Text('33',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                  ),
                )
              ],
            ),
          ListTile(
            title: const Text('About',style: TextStyle(color: AppColors.mygray500),),
            trailing: TextButton(
              child: const Text('Edit',style: TextStyle(color: AppColors.myblue500),),
              onPressed: (){

              },
              
            ),
          ),
          const ListTile(title: Text("I'm Hossam Zayed , I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",style: TextStyle(color: AppColors.mygray500),)),
          Container(
            padding: const EdgeInsets.only(left: 10,top: 8),
            width: double.infinity,
            height: 40,
            color: AppColors.mygray100,
            child: const Text('General',style: TextStyle(color: AppColors.mygray500),),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.general.length,
                itemBuilder: (context,i){
                  return ConGeneral(txt: controller.general[i],img: controller.imgs[i],onPressed: controller.Functions[i],);
                }
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10,top: 8),
            width: double.infinity,
            height: 40,
            color: AppColors.mygray100,
            child: const Text('Others',style: TextStyle(color: AppColors.mygray500),),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),

                itemCount: controller.others.length,
                itemBuilder: (context,i){
                  return ConGeneral(txt: controller.others[i],imgs: false,onPressed: controller.FunctionsOthers[i],);
                }
            ),
          ),
        ],
      ),
    );
  }
}
