import 'package:flutter/material.dart';
import 'package:job_finder/model/saved_jobs_model.dart';

class MySavedJobs extends StatelessWidget {
  SavedJobsModel savedModel;
  void Function()? onPressed;
  MySavedJobs({super.key,required this.savedModel,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Row(
        children: [
          Image.network('${savedModel.img}',width: 70,height: 70,),
          SizedBox(
            width:MediaQuery.of(context).size.width * 0.69,
            child: ListTile(
              title: Text("${savedModel.name}"),
              subtitle: Text('${savedModel.comp_name}'),
              trailing: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: onPressed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
