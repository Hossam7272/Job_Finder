import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/profile_controller.dart';
import 'package:job_finder/widgets/apply_job/upload_pdf.dart';
import 'package:path/path.dart';
import '../../const/mycolors.dart';
import '../../widgets/apply_job/upload_pdf2.dart';
import '../../widgets/mybtn.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Portfolio'),
      ),
      body: GetBuilder<ProfileController>(builder: (controller){
        return Column(
          children: [
            const ListTile(title: Text('Add portfolio here',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ListTile(
              title: DottedBorder(
                color: AppColors.myblue500,
                child: Container(
                  height: MediaQuery.of(context).size.height /4,
                  width: double.infinity,
                  color: AppColors.myblue2,
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/img/document-upload.svg'),
                      const Text('Upload your other file',style: TextStyle(fontWeight: FontWeight.bold),),
                      const Text('Max. file size 10 MB',style: TextStyle(color: AppColors.mygray400,fontSize: 15),),
                      const SizedBox(height: 20,),
                      ListTile(
                          title: MyBtn(text: 'Add file',onPressed: ()async{
                            controller.uploadCV();
                          },
                          )
                      )
                    ],
                  ),
                ),

              ),
            ),
            ListTile(
              title: controller.upload== false ? const Text('') : const UploadPDF2() ,
            )

          ],
        );
      },)

    );
  }
}
