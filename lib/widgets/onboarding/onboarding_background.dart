import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_finder/widgets/onboarding/skipbutton.dart';
class OnBoardingBackground extends StatelessWidget {
  Widget img;
  OnBoardingBackground({super.key,required this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        img,
        Positioned(
          top: 20,
          left: 24,
          child: SvgPicture.asset('assets/img/Logo.svg'),
        ),
        Positioned(
            top: 20,
            right: 24,
            child: SkipButton()
        ),
      ],
    );
  }
}
