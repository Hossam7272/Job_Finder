import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/mycolors.dart';

class ConGeneral extends StatelessWidget {
  String? img;
  String? txt;
  bool ? imgs ;
  void Function()? onPressed;
  ConGeneral({super.key,this.txt,this.img,this.imgs = true,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: AppColors.mygray100))
      ),
      child: ListTile(
        title:  Text('$txt'),
        leading: imgs == true ? CircleAvatar(backgroundColor: AppColors.myblue2,child: SvgPicture.asset('assets/img/$img',),) : null,
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: onPressed
        ),
      ),
    );
  }
}
