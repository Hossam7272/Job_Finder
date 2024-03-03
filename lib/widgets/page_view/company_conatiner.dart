import 'package:flutter/cupertino.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/model/job_model.dart';

class CompanyContainer extends StatelessWidget {
  JobModel model;
  CompanyContainer({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact Us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 3),
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(width: 1)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email",style: TextStyle(color: AppColors.mygray400),),
                  Text("${model.comp_email}",style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              padding: const EdgeInsets.only(left: 3),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(width: 1)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Website",style: TextStyle(color: AppColors.mygray400),),
                  Text("${model.comp_website}",style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ],
        ),
        const Text('About Company',style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
        Text('${model.about_company}')
      ],


    );
  }
}
