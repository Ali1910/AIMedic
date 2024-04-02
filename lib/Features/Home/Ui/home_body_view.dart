import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_body_continer_list_view.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_medication_info_list_view.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_news_container.dart';
import 'package:gbsub/Features/Home/Ui/widgets/custom_tab_bar_list_view.dart';
import 'package:gbsub/Features/Speciality/Ui/speciality_view.dart';

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
              widget1: SpecialityView(),
              widget2: SpecialityView(),
              widget3: Text('aa'),
            ),
            const CustomServiceRowCustomBodyContinerListView(
              mainText: 'خدماتنا الالكترونية',
              icon1: FontAwesomeIcons.personDotsFromLine,
              icon2: FontAwesomeIcons.disease,
              icon3: FontAwesomeIcons.capsules,
              text1: 'تشخيص',
              text2: 'تنبؤات',
              text3: 'تعارضات ادوية ',
              widget1: Text('aa'),
              widget2: Text('aa'),
              widget3: Text('aa'),
            ),
            const CustomNewsContainer(),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const DrugContentView();
                  //     },
                  //   ),
                  // );
                },
                child: const CustomMedicalInfoListView()),
          ],
        ),
      ),
    );
  }
}
