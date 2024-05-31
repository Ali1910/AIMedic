import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_tab.dart';

import 'package:gbsub/Features/bmi_medical_record/logic/cubit/bmi_record_cubit.dart';
import 'package:gbsub/Features/bmi_medical_record/logic/repo/bmi_record_repo_implimentation.dart';
import 'package:gbsub/Features/bmi_medical_record/ui/bmi_medical_record_view_body.dart';
import 'package:gbsub/Features/medical_visits/ui/medical_vistis_record_view_body.dart';
import 'package:gbsub/Features/vital%20_readings/ui/vital_readings_medical_view_body.dart';

class MedicalHistoryView extends StatelessWidget {
  const MedicalHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: mainColor),
            title: Text(
              "السجل المرضي",
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: mainColor,
              indicatorColor: mainColor,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                CustomTabBar(text: 'BMI'),
                CustomTabBar(text: 'قراءات حيوية'),
                CustomTabBar(text: 'الزيارات الطبية')
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BlocProvider(
                create: (context) =>
                    BmiRecordCubit(BMIRecordRepoImpl(APiService(Dio())))
                      ..getAllReadsForUser(
                        Sharedhelper.getintdata(intkey),
                      ),
                child: BMIMedicalRecordBody(),
              ),
              VitalReadingsViewBody(),
              MedicalVisitsrecordViewbody()
            ],
          ),
        ),
      ),
    );
  }
}
