import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/perrsonal_details/ui/widgets/custom_personal_details_continer.dart';
import 'package:gbsub/Features/profile_page/data/profile_model.dart';
import 'package:gbsub/core/utilts/style.dart';

class PersonalDetailsViewBody extends StatelessWidget {
  const PersonalDetailsViewBody({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "تحكم في بياناتك الشخصية لخدمة أفضل يمكنك تعديل كلمة السر , رقم هاتفك , مدينتك",
              maxLines: 3,
              textAlign: TextAlign.start,
              style: Styles.styleBold16.copyWith(
                color: mainColor,
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomPersonalDetailsContiner(
            title: 'الأسم',
            data: profileModel.name,
            updated: false,
          ),
          CustomPersonalDetailsContiner(
            title: 'الايميل',
            data: profileModel.email,
            updated: false,
          ),
          CustomPersonalDetailsContiner(
            title: 'النوع',
            data: profileModel.gender,
            updated: false,
          ),
          CustomPersonalDetailsContiner(
            title: 'رقم الهاتف',
            data: profileModel.pN,
            onPressed: () {},
            updated: true,
          ),
          CustomPersonalDetailsContiner(
            title: 'المدينة',
            data: profileModel.city,
            onPressed: () {},
            updated: true,
          ),
          CustomPersonalDetailsContiner(
            title: 'كلمة السر',
            data: '******',
            onPressed: () {},
            updated: true,
          ),
        ],
      ),
    );
  }
}
