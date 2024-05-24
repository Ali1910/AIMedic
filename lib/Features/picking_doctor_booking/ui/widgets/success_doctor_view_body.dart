import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/Features/doctor_booking/ui/booking_view.dart';

import 'package:gbsub/Features/picking_doctor_booking/logic/get_doctor_by_speciality.dart';
import 'package:gbsub/Features/picking_doctor_booking/ui/widgets/custom_doctor_item.dart';

class SuccessDoctorViewBody extends StatelessWidget {
  const SuccessDoctorViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) {
                      return BookingView(
                        doctorDataModel: BlocProvider.of<DoctorCubit>(context)
                            .doctors[index],
                      );
                    },
                  ),
                );
                await BlocProvider.of<BookingCubit>(context).getTimesForDoctor(
                  doctorid:
                      BlocProvider.of<DoctorCubit>(context).doctors[index].id,
                  year: DateTime.now().year.toString(),
                  day: DateTime.now().day.toString(),
                  month: DateTime.now().month.toString(),
                );
              },
              child: CustomDoctorItem(
                doctorDataModel:
                    BlocProvider.of<DoctorCubit>(context).doctors[index],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.grey.withOpacity(0.1),
              thickness: 3,
              endIndent: 20,
            );
          },
          itemCount: BlocProvider.of<DoctorCubit>(context).doctors.length,
        ),
      ),
    );
  }
}
