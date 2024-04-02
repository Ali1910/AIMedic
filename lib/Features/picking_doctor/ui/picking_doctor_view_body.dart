import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/picking_doctor/logic/get_doctor_by_speciality.dart';
import 'package:gbsub/Features/picking_doctor/ui/widgets/success_doctor_view_body.dart';

class PickingDoctorViewBody extends StatelessWidget {
  const PickingDoctorViewBody({super.key, required this.spec});
  final String spec;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<DoctorCubit>(context).getdoctor(spec),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const SuccessDoctorViewBody();
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        }
      },
    );
  }
}
