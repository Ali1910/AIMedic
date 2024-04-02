import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/Speciality/Ui/speciality_view_boy.dart';
import 'package:gbsub/core/utilts/style.dart';

class SpecialityView extends StatelessWidget {
  const SpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: mainColor),
          title: Text(
            'التخصصات',
            style: Styles.styleBold24.copyWith(color: mainColor),
          ),
        ),
        body: const SPecialityViewBody(),
      ),
    );
  }
}
