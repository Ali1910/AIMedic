import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_body_continer_list_view.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_medication_info_list_view.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_news_container.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_tab_bar_list_view.dart';

import 'package:gbsub/Features/covid19_radiography/ui/coivid19_view.dart';

import 'package:gbsub/Features/diabetes_preidiction/ui/diabetes_view.dart';
import 'package:gbsub/Features/speciality_booking_doctor/Ui/speciality_view.dart';
import 'package:gbsub/Features/speciality_contact_doctor/Ui/speciality_view.dart';
import 'package:gbsub/Features/syptoms/ui/syptoms_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const CustomTabBar(),
            SizedBox(
              height: 20.h,
            ),
            const CustomServiceRowCustomBodyContinerListView(
              mainText: 'خدماتنا الطبية',
              icon1: FontAwesomeIcons.userDoctor,
              icon2: FontAwesomeIcons.squareWhatsapp,
              icon3: FontAwesomeIcons.solidBell,
              text1: 'اختيار  طبيب',
              text2: 'محادثة طبيب',
              text3: 'تذكيرات',
              widget1: SpecialityViewPicking(),
              widget2: SpecialityViewContact(),
              widget3: Text('aa'),
            ),
            const CustomServiceRowCustomBodyContinerListView(
              mainText: 'خدماتنا الالكترونية',
              icon1: FontAwesomeIcons.personDotsFromLine,
              icon2: FontAwesomeIcons.glassWaterDroplet,
              icon3: FontAwesomeIcons.virusCovid,
              text1: 'تشخيص',
              text2: 'سكر الدم',
              text3: 'كوفيد 19',
              widget1: SyptomsView(),
              widget2: DiabetesView(),
              widget3: Covid19View(),
            ),
            const CustomNewsContainer(),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
                onTap: () {}, child: const CustomMedicalInfoListView()),
          ],
        ),
      ),
    );
  }
}
