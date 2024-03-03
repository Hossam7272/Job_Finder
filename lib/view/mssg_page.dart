import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/controller/MessagesController.dart';
import 'package:job_finder/widgets/myform.dart';
import 'package:job_finder/widgets/receivercon.dart';
import 'package:job_finder/widgets/sendercon.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    MessagesController controller = Get.find();
    int index = Get.arguments['index'];
    return Scaffold(
      appBar:  AppBar(
        title: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/img/Dana Logo.png'),
                const SizedBox(width: 10,),
                Text('${controller.companyList[index]['name']}')
              ],
            ),
          trailing: const Icon(Icons.menu),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width *0.7,
                child: ListView.builder(
                    itemCount: controller.compMssgList.value.length,
                    itemBuilder: (context,i){
                      return Column(
                        crossAxisAlignment: controller.compMssgList.value[i]['sender_user'] == 'user' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                        children: [
                          controller.compMssgList.value[i]['sender_user'] == 'user'
                                  ? SenderCon(txt: '${controller.compMssgList.value[i]['massage']}',)
                                  : ReceiverCon(txt: '${controller.compMssgList.value[i]['massage']}',)

                        ],
                      );
                    }
                ),
              ),
          ),
          Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                    title: MyForm(con: controller.mssgCon,text: 'Write a message',),
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                          radius: 19,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.attach_file_outlined)
                      ),
                    ),
                  trailing: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.mic)
                    ),
                  ),
                ),
              )
          )
        ],

      ),
    );
  }
}
