import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_finder/model/job_model.dart';

class MyCardJobs extends StatelessWidget {
  JobModel jobmodel ;
  Color? mycolor;
  void Function()? onTap;
  Color? iconColor;
  void Function()? iconPress;
  MyCardJobs({super.key,required this.jobmodel,this.mycolor,this.onTap,this.iconPress,this.iconColor});


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 20,
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: ShapeDecoration(
          color: mycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
                  children: [
                  //-------------------------first one----------------------------
                  SizedBox(
                    child: SizedBox(
                            height: 60,
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 4,
                                          top: 4,
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              color: Colors.white
                                            ),
                                            child: Image.network('${jobmodel.img}')
                                          ),
                                          ),

                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    flex:3,
                                    child: Text('${jobmodel.name}', style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500,),)
                                ),
                                Expanded(
                                    child: SizedBox(
                                        width: 44,
                                        height: 44,
                                        child:IconButton(onPressed: iconPress, icon: SvgPicture.asset(
                                            'assets/img/archive-minus.svg',
                                          color: iconColor ,),
                                          )

                                    ),
                                  )

                              ],
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  //---------------------------second one----------------------------------------
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height:30,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 6),
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.14000000059604645),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Text(
                                '${jobmodel.job_time_type}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                  letterSpacing: 0.12,
                                ),
                              ),

                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 6),
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.14000000059604645),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Text(
                                '${jobmodel.job_type}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                  letterSpacing: 0.12,
                                ),
                              ),

                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  //----------------------last one---------------------
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$${jobmodel.salary}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '/Month',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap:  onTap,
                          child: Container(
                            width: 96,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF3366FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1000),
                              ),
                            ),
                            child: const Text(
                              'Apply now',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

      );
    
  }
}
