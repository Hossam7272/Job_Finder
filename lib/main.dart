import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder/view/apply_job.dart';
import 'package:job_finder/view/auth/forgot_pass.dart';
import 'package:job_finder/view/auth/login.dart';
import 'package:job_finder/view/auth/signup/mywork.dart';
import 'package:job_finder/view/auth/signup/signup.dart';
import 'package:job_finder/view/auth/signup/success_signup.dart';
import 'package:job_finder/view/auth/success_reset.dart';
import 'package:job_finder/view/btn_nav.dart';
import 'package:job_finder/view/filter_page.dart';
import 'package:job_finder/view/mssg_page.dart';
import 'package:job_finder/view/notification.dart';
import 'package:job_finder/view/profile/Notification.dart';
import 'package:job_finder/view/profile/accessibilty.dart';
import 'package:job_finder/view/profile/edit_profile.dart';
import 'package:job_finder/view/job_applied.dart';
import 'package:job_finder/view/job_details.dart';
import 'package:job_finder/view/onboarding/onboarding_screen.dart';
import 'package:job_finder/view/onboarding/splash_screen.dart';
import 'package:job_finder/view/profile/help_center.dart';
import 'package:job_finder/view/profile/language.dart';
import 'package:job_finder/view/profile/portfolio.dart';
import 'package:job_finder/view/profile/privacy.dart';
import 'package:job_finder/view/profile/security/change_email.dart';
import 'package:job_finder/view/profile/security/change_phone.dart';
import 'package:job_finder/view/profile/security/security.dart';
import 'package:job_finder/view/profile/terms.dart';
import 'package:job_finder/view/search_result.dart';
import 'package:job_finder/view/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:job_finder/view/notification.dart';

late SharedPreferences savey;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  savey = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash_screen',
      getPages: [
        GetPage(name: '/splash_screen', page: ()=> const SplashScreen()),
        GetPage(name: '/onboarding_screen', page: ()=>  OnBoardingScreen()),
        GetPage(name: '/signup', page: ()=> const SignUp()),
        GetPage(name: '/mywork', page: ()=> const MyWork()),
        GetPage(name: '/success_signup', page: ()=> const SuccessSignup()),
        GetPage(name: '/login', page: ()=> const Login()),
        GetPage(name: '/forgot_pass', page: ()=> const ForgotPass()),
        GetPage(name: '/success_reset', page: ()=> const SuccessReset()),
        GetPage(name: '/home', page: ()=>  const ButtonNavigate()),
        GetPage(name: '/search_result' , page: ()=> SearchResult()),
        GetPage(name: '/search_screen' , page: ()=> SearchScreen()),
        GetPage(name: '/job_details' , page: ()=>  JobDetails()),
        GetPage(name: '/apply_job' , page: ()=>  const ApplyJob()),
        GetPage(name: '/job_applied' , page: ()=>  const JobApplied()),
        GetPage(name: '/edit_profile' , page: ()=>  const EditProfile()),
        GetPage(name: '/protifolo' , page: ()=>  const Portfolio()),
        GetPage(name: '/language' , page: ()=>  const LangaugePage()),
        GetPage(name: '/Notification' , page: ()=>  const NotificationPage()),
        GetPage(name: '/security' , page: ()=>  const SecurityPage()),
        GetPage(name: '/filter_page' , page: ()=>  const FilterPage()),
        GetPage(name: '/mssg_page' , page: ()=>  const MessagePage()),
        GetPage(name: '/change_email' , page: ()=>  const ChangeEmail()),
        GetPage(name: '/change_phone' , page: ()=>  const ChangePhone()),
        GetPage(name: '/accessibility' , page: ()=>  const Accesibility()),
        GetPage(name: '/help_center' , page: ()=>  const HelpCenter()),
        GetPage(name: '/terms' , page: ()=>  const Terms()),
        GetPage(name: '/privacy' , page: ()=>  const Privacy_Policy()),
        GetPage(name: '/notification' , page: ()=>  const OrgNotification()),
      ],

    );
  }
}


