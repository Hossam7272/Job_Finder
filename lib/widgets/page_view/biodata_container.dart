import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/main.dart';
import 'package:job_finder/widgets/mybtn.dart';
import 'package:job_finder/widgets/myform.dart';

class BioContainer extends StatelessWidget {
  void Function()? onPressed;
  TextEditingController phonecon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  TextEditingController namecon = TextEditingController();
  BioContainer({super.key,this.onPressed,required this.phonecon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const ListTile(
            title: Text('Biodata',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            subtitle: Text('Fill in your bio data correctly',style: TextStyle(color: AppColors.mygray500),),
          ),
          ListTile(
            title: const Text('Full Name'),
            subtitle: MyForm(con: namecon,text: '${savey.getString('username')}',),
          ),
          ListTile(
            title: const Text('Email'),
            subtitle: MyForm(con: emailcon,text: '${savey.getString('email')}',),
          ),
          ListTile(
            title: const Text('Phone'),
            subtitle: MyForm(con: phonecon,text: 'Enter your phone number',),
          ),
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                  child: ListTile(title: MyBtn(text: 'Next',onPressed: onPressed,)))
          )

        ],
      ),

    );
  }
}
