import 'package:flutter/material.dart';
import 'package:job_finder/widgets/work_container.dart';
import '../../const/mycolors.dart';
import '../mybtn.dart';

class TypeWorkContainer extends StatelessWidget {
  void Function()? onPressed;
  TypeWorkContainer({super.key,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const ListTile(
            title: Text('Type of work',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            subtitle: Text('Fill in your bio data correctly',style: TextStyle(color: AppColors.mygray500),),
          ),
          ListTile(title: WorkContainer(text: "Senior UX Designer",)),
          ListTile(title: WorkContainer(text: "Senior UI Designer",)),
          ListTile(title: WorkContainer(text: "Graphic Designer",)),
          ListTile(title: WorkContainer(text: "Front-End Developer",)),
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                  child: ListTile(title: MyBtn(text: 'Next',onPressed: onPressed,))
              )
          )

        ],
      ),

    );
  }
}
