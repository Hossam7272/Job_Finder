import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/controller/profile_controller.dart';
import 'package:job_finder/widgets/search_form.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Help Center'),
      ),
      body: GetBuilder<ProfileController>(builder: (controller){
        return ListView(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListTile(title: SearchForm(con: controller.conHelp,))
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListTile(
                title: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context,i){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(width: 1)
                              )
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text('Lorem ipsum dolor sit amet'),
                                trailing: IconButton(onPressed: (){
                                  controller.notShow(i);
                                }, icon: controller.show[i] ==false ? const Icon(Icons.keyboard_arrow_down) : const Icon(Icons.keyboard_arrow_up_rounded),
                                ),
                              ),
                              controller.show[i] == false ? const Text('') :
                              const ListTile(title: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante, suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate. Curabitur ornare velit nec fringilla finibus. Phasellus mollis pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris.',style: TextStyle(color: AppColors.mygray500),)),

                            ],
                          ),
                      );
                    }),
              ),
            ),
          ],
        );
      },)




    );
  }
}
