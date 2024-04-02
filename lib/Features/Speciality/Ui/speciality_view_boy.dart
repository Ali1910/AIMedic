import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Features/Speciality/Data/speciality_data.dart';
import 'package:gbsub/Features/Speciality/Ui/widgets/speciality_item.dart';

class SPecialityViewBody extends StatelessWidget {
  const SPecialityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 30.w, crossAxisSpacing: 10.h),
        itemCount: SpecData.data['image'].length,
        itemBuilder: (BuildContext context, int index) {
          return SpecialityItem(
            index: index,
            spec: SpecData.data['title'][index],
          );
        },
      ),
    );
  }
}
