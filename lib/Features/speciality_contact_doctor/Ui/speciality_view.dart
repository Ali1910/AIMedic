import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/speciality_contact_doctor/Ui/speciality_view_boy.dart';

class SpecialityViewContact extends StatelessWidget {
  const SpecialityViewContact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppbar(title: 'التخصصات'),
        body: SPecialityViewBody(),
      ),
    );
  }
}
