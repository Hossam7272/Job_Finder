import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/apply_controller.dart';

class Applied extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ApplyController controller = Get.put(ApplyController());
    return Scaffold(
      appBar: AppBar(centerTitle: true , title: const Text('Applied Job'),),
      body: ListView(
        children: [
          ListTile(
            title: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F5),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: GetBuilder<ApplyController>(builder: (controller){
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: controller.pageValue == 0 ? AppColors.myblue500 : Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text('Active',style: TextStyle(color: controller.pageValue == 0 ? Colors.white : Colors.black ),),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: controller.pageValue == 1 ? AppColors.myblue500 : Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text('Rejected',style: TextStyle(color: controller.pageValue == 1 ? Colors.white : Colors.black ),),
                          ),
                        ),
                      ),
                    ],
                  );
                },)
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              controller: controller.controllerApplied,
              onPageChanged: (val){
                controller.ChangePage(val);
              },
              children: [
                ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      color: AppColors.mygray100,
                      child: const Text('3 jobs',style: TextStyle(color: AppColors.mygray500),),
                    ),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('UI/UX Designer'),
                          subtitle: const Text('Spectrum • Jakarta, Indonesia '),
                          trailing:SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
                          leading: const Icon(Icons.icecream_rounded),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Full time', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Remote', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text('Posted 2 days ago',),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.mygray300 , width: 1))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.myblue500,
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.myblue500,
                                          radius: 24,
                                          child: Text('1',style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    Text('Biodata',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('2',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Type of work',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('3',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Upload portfolio',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('UI/UX Designer'),
                          subtitle: const Text('Spectrum • Jakarta, Indonesia '),
                          trailing:SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
                          leading: const Icon(Icons.icecream_rounded),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Full time', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Remote', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text('Posted 2 days ago',),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.mygray300 , width: 1))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.myblue500,
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.myblue500,
                                          radius: 24,
                                          child: Text('1',style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    Text('Biodata',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('2',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Type of work',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('3',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Upload portfolio',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('UI/UX Designer'),
                          subtitle: const Text('Spectrum • Jakarta, Indonesia '),
                          trailing:SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
                          leading: const Icon(Icons.icecream_rounded),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Full time', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Remote', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text('Posted 2 days ago',),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.mygray300 , width: 1))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.myblue500,
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.myblue500,
                                          radius: 24,
                                          child: Text('1',style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    Text('Biodata',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('2',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Type of work',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('3',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Upload portfolio',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('UI/UX Designer'),
                          subtitle: const Text('Spectrum • Jakarta, Indonesia '),
                          trailing:SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
                          leading: const Icon(Icons.icecream_rounded),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Full time', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Remote', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text('Posted 2 days ago',),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.mygray300 , width: 1))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.myblue500,
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.myblue500,
                                          radius: 24,
                                          child: Text('1',style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    Text('Biodata',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('2',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Type of work',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('3',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Upload portfolio',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      color: AppColors.mygray100,
                      child: const Text('3 jobs',style: TextStyle(color: AppColors.mygray500),),
                    ),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('UI/UX Designer'),
                          subtitle: const Text('Spectrum • Jakarta, Indonesia '),
                          trailing:SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
                          leading: const Icon(Icons.icecream_rounded),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Full time', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Remote', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text('Posted 2 days ago',),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.mygray300 , width: 1))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.myblue500,
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.myblue500,
                                          radius: 24,
                                          child: Text('1',style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    Text('Biodata',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('2',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Type of work',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('3',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Upload portfolio',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('UI/UX Designer'),
                          subtitle: const Text('Spectrum • Jakarta, Indonesia '),
                          trailing:SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
                          leading: const Icon(Icons.icecream_rounded),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Full time', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Remote', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text('Posted 2 days ago',),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.mygray300 , width: 1))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.myblue500,
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.myblue500,
                                          radius: 24,
                                          child: Text('1',style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    Text('Biodata',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('2',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Type of work',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('3',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Upload portfolio',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('UI/UX Designer'),
                          subtitle: const Text('Spectrum • Jakarta, Indonesia '),
                          trailing:SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
                          leading: const Icon(Icons.icecream_rounded),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Full time', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Remote', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text('Posted 2 days ago',),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.mygray300 , width: 1))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.myblue500,
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.myblue500,
                                          radius: 24,
                                          child: Text('1',style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    Text('Biodata',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('2',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Type of work',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('3',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Upload portfolio',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('UI/UX Designer'),
                          subtitle: const Text('Spectrum • Jakarta, Indonesia '),
                          trailing:SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
                          leading: const Icon(Icons.icecream_rounded),
                        ),
                        ListTile(
                          title: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Full time', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6E4FF),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Center(
                                  child: Text('Remote', style: TextStyle(color: Color(0xFF3366FF),),),
                                ),
                              ),
                            ],
                          ),
                          trailing: const Text('Posted 2 days ago',),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: AppColors.mygray300 , width: 1))
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.myblue500,
                                      child: CircleAvatar(
                                          backgroundColor: AppColors.myblue500,
                                          radius: 24,
                                          child: Text('1',style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    Text('Biodata',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('2',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Type of work',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                              Text("..."),
                              Expanded(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: AppColors.mygray400,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 24,
                                          child: Text('3',style: TextStyle(color: AppColors.mygray500),)
                                      ),
                                    ),
                                    Text('Upload portfolio',style: TextStyle(fontSize: 12),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                  ],
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}