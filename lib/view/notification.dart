import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/main.dart';
import 'package:job_finder/widgets/mybtn.dart';


class OrgNotification extends StatelessWidget {
  const OrgNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notification'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15,top: 5),
            height: 35,
            color: AppColors.mygray100,
            child: const Text('New',style: TextStyle(color: AppColors.mygray500,fontSize: 17),),
          ),
          ListTile(
            title: const Text('Dana'),
            leading: Image.asset('assets/img/Dana.png'),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const  Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: AppColors.warningColor,
                  ),
                  SizedBox(width: 10,),
                  Text('10.00AM'),
                ],
              ),
            ) ,
            subtitle: const Text('Posted new design jobs'),
          ),
          ListTile(
            title:  const Text('Shoope'),
            leading: Image.asset('assets/img/Shoope.png'),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const  Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: AppColors.warningColor,
                  ),
                  SizedBox(width: 10,),
                  Text('10.00AM'),
                ],
              ),
            ) ,
            subtitle: const Text('Posted new design jobs'),
          ),
          ListTile(
            title: const Text('Slack'),
            leading: Image.asset('assets/img/Slack.png'),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const  Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: AppColors.warningColor,
                  ),
                  SizedBox(width: 10,),
                  Text('10.00AM'),
                ],
              ),
            ) ,
            subtitle: const Text('Posted new design jobs'),
          ),
          ListTile(
            title: const Text('Facebook'),
            leading: Image.asset('assets/img/Facebook.png'),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const  Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: AppColors.warningColor,
                  ),
                  SizedBox(width: 10,),
                  Text('10.00AM'),
                ],
              ),
            ) ,
            subtitle: const Text('Posted new design jobs'),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15,top: 5),
            height: 35,
            color: AppColors.mygray100,
            child: const Text('Yesterday',style: TextStyle(color: AppColors.mygray500,fontSize: 17),),
          ),
          ListTile(
            title: const Text('Email setup successful'),
            leading: SvgPicture.asset('assets/img/Jobsque.svg'),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: const  Row(
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: AppColors.warningColor,
                  ),
                  SizedBox(width: 10,),
                  Text('10.00AM'),
                ],
              ),
            ) ,
            subtitle: const Text('Hello Rafif Dian Axelingga,'),
          ),

          ListTile(
            title: const Text('Welcome to Jobsque'),
            leading: SvgPicture.asset('assets/img/Jobsque.svg'),
            trailing: const Text('8.00AM') ,
            subtitle: const Text('Hello Rafif Dian Axelingga,'),
          ),
          MyBtn(onPressed: (){print('${savey.getString('token')}');},text: 'adf',)
        ],
      ),


    );
  }
}
