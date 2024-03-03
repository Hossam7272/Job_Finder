import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/profile_controller.dart';
import 'package:job_finder/main.dart';
import 'package:job_finder/widgets/mybtn.dart';
import 'package:job_finder/widgets/myform.dart';

class EditProfile extends StatelessWidget {
   const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit profile'),
      ),
      body: Column(
        children: [
             ListTile(
                  title: const CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
                    ),
                  subtitle: Center(
                      child: TextButton(onPressed: (){
                        controller.chagePhoto();
                      }, child: const  Text("Change Photo",style: TextStyle(color: AppColors.myblue500),))
                  ),
                ),
              Expanded(
                  child: ListTile(
                    title: const Text('Bio'),
                    subtitle: MyForm(con: controller.biocon,text: 'Bio',),
                  ),
                ),
              Expanded(
                child: ListTile(
                  title: const Text('Address'),
                  subtitle: MyForm(con: controller.addresscon,text: 'Address',),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Mobile'),
                  subtitle: MyForm(con: controller.mobilecon,text: 'Mobile',),
                ),
              ),
              Expanded(
                 child: Align(
                   alignment: FractionalOffset.bottomCenter,
                   child: ListTile(
                                title: MyBtn(
                                  text: 'Save',
                                  onPressed: ()async{
                                    await controller.editProfile();
                                    print('${savey.getString('token')}');
                                  },
                                ),
                            ),
                 ),
               ),

            ],
          ),


    );
  }
}
