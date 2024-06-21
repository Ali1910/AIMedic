import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/failed_body.dart';
import 'package:gbsub/Core/utilts/widgets/loading_body.dart';
import 'package:gbsub/Features/medical_visits/logic/medical_visits_cubit.dart';

class MedicalVisitsrecordViewbody extends StatelessWidget {
  const MedicalVisitsrecordViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<MedicalVisitsCubit>(context);
    return FutureBuilder(
        future: of.getMedicalVisitsForUser(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingBody();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: ShapeDecoration(
                        color: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              of.medicalVisits[index].summaryofthesession,
                              style: Styles.styleBold16
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              of.medicalVisits[index].date.substring(0, 16),
                              style:
                                  Styles.style14.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          of.medicalVisits[index].maindisease,
                          style: Styles.style14.copyWith(color: Colors.white),
                          maxLines: 3,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemCount: of.medicalVisits.length),
            );
          } else {
            return const FailedBody(text: 'تاكد من الأنترنت');
          }
        });
  }
}
