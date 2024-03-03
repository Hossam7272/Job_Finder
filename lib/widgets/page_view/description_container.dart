import 'package:flutter/cupertino.dart';
import 'package:job_finder/model/job_model.dart';

class DescriptionContainer extends StatelessWidget {
  JobModel model;
  DescriptionContainer({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Job Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text('${model.jobDescription}'),
          const Text('Skill Required',style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
          Text('${model.jobSkills}')
        ],


    );
  }
}
