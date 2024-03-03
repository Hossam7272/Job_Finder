import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/model/onboarding_model.dart';

import '../widgets/mybtn.dart';
import '../widgets/onboarding/onboarding_background.dart';


  List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
        btn: MyBtn(text: 'Next',onPressed: (){Get.offNamed('/onboarding2');},)
        ,img:OnBoardingBackground(img: SvgPicture.asset('assets/img/Background.svg')),
        title: SvgPicture.asset('assets/img/Tittle.svg'),
  ),
    OnBoardingModel(
        btn: MyBtn(text: 'Next',onPressed: (){Get.offNamed('/onboarding3');},)
        ,img:OnBoardingBackground(img: Image.asset('assets/img/Background-2.png')),
        title: SvgPicture.asset('assets/img/Tittle-1.svg'),
  ),
    OnBoardingModel(
        btn: MyBtn(text: 'GetStarted',onPressed: (){Get.offNamed('/signup');},)
        ,img:OnBoardingBackground(img: Image.asset('assets/img/Background.png')),
        title: SvgPicture.asset('assets/img/Tittle-2.svg'),
  ),
  ];
