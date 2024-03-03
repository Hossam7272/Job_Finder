import 'dart:io';
import 'package:path/path.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/apply_controller.dart';
import 'package:job_finder/widgets/apply_job/upload_btn.dart';
import 'package:job_finder/widgets/apply_job/upload_pdf.dart';
import '../../const/mycolors.dart';
import '../mybtn.dart';

class UplaodprotofoloContainer extends StatelessWidget {
  void Function()? onPressed;
  UplaodprotofoloContainer({super.key,this.onPressed});

  @override
  Widget build(BuildContext context) {
    ApplyController controller = Get.find();
    return SizedBox(
      child: Column(
        children: [
          const ListTile(
            title: Text('Upload portfolio',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            subtitle: Text('Fill in your bio data correctly',style: TextStyle(color: AppColors.mygray500),),
          ),
          GetBuilder<ApplyController>(
              builder: (controller){
                return ListTile(
                  title: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(width: 1)
                        )
                    ),
                    child: Center(
                        child: controller.upload == false ? const UploadBtn() : const UploadPDF()
                    ),
                  ),
                );
              }
          ),
          const ListTile(
            title: Text('Other File',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
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
                      ListTile(title: MyBtn(text: 'Add file',onPressed: ()async{
                        FilePickerResult? result = await FilePicker.platform.pickFiles();
                        if (result != null) {
                          controller.otherfile = File(result.files.single.path!);
                        } else {
                          Get.defaultDialog(
                              middleText: 'please other files'
                          );
                        }
                        },
                      )
                      )
                    ],
                  ),
                ),

            ),
          ),

          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                title: MyBtn(text: 'Submit',onPressed: onPressed,),
              )),
          ),


        ],
      ),

    );
  }
}