import 'package:flutter/cupertino.dart';
import 'package:job_finder/const/mycolors.dart';

class ReceiverCon extends StatelessWidget {
  String? txt;
  ReceiverCon({super.key,this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 15),

      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: AppColors.mygray300
      ),
      child: Text('$txt'),
    );
  }
}
