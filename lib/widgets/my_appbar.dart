import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Job Detail'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,),
        )
      ],

    );
  }
}
