import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  String? subtxt;
  Widget? child;
  Color? mycolor;
  MyCircle({super.key,this.subtxt,this.child,this.mycolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: mycolor,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 24,
              child: child
          ),
        ),
        Text('$subtxt',style: const TextStyle(fontSize: 12),)
      ],
    );
  }
}
