import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/home_controller.dart';
import 'package:job_finder/widgets/mybtn.dart';
import 'package:job_finder/widgets/myform.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Set Filter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Job Tittle'),
            subtitle: MyForm(con: controller.titlecon,text: 'Job Tittle',),
          ),
          ListTile(
            title: const Text('Location'),
            subtitle: MyForm(con: controller.locationcon,text: 'Location',prefixIcon: SvgPicture.asset('assets/img/location.svg',)),
          ),
          ListTile(
            title: const Text('Salary'),
            subtitle: MyForm(con: controller.salarycon,text: 'Salary',prefixIcon: SvgPicture.asset('assets/img/dollar.svg'),),
          ),
           ListTile(title: MyBtn(text: 'Show result',onPressed: (){
             controller.filteration();
                },),),




        ],
      ),
    );
  }
}
