import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder/const/mycolors.dart';
import 'package:job_finder/model/job_model.dart';

class RecentJobs extends StatelessWidget {
  JobModel jobModel;
  RecentJobs({super.key,required this.jobModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.mygray300))
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(child: Image.network('${jobModel.img}')),
                  Expanded(
                    flex: 3,
                      child: Text('${jobModel.name}',style: const  TextStyle( fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500, ),)
                  ),
                  Expanded(child: SvgPicture.asset('assets/img/archive-minus.svg',color: Colors.black,)),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      decoration: ShapeDecoration(
                        color: AppColors.myblue2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        '${jobModel.job_type}',
                        style: const TextStyle(
                          color: AppColors.myblue500,
                          fontSize: 12,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: AppColors.myblue2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        '${jobModel.job_time_type}',
                        style: const TextStyle(
                          color: AppColors.myblue500,
                          fontSize: 12,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                          letterSpacing: 0.12,
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(width: 40,),
                  Expanded(
                    flex: 2,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${jobModel.salary}',
                            style: const TextStyle(
                              color: Color(0xFF2E8E18),
                              fontSize: 17,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const TextSpan(
                            text: '/Month',
                            style: TextStyle(
                              color: AppColors.mygray500,
                              fontSize: 10,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
