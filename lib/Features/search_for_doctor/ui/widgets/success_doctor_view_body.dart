import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/Features/doctor_booking/ui/booking_view.dart';
import 'package:gbsub/Features/search_for_doctor/logic/cubit/search_cubit.dart';
import 'package:gbsub/Features/search_for_doctor/logic/cubit/search_state.dart';
import 'package:gbsub/Features/search_for_doctor/ui/widgets/custom_doctor_item.dart';

class SuccessDoctorViewBody extends StatelessWidget {
  const SuccessDoctorViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return state.listOfdoctors.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) {
                              return BookingView(
                                doctorDataModel: state.listOfdoctors[index],
                              );
                            },
                          ),
                        );
                        await BlocProvider.of<BookingCubit>(context)
                            .getTimesForDoctor(
                          doctorid: state.listOfdoctors[index].id,
                          year: DateTime.now().year.toString(),
                          day: DateTime.now().day.toString(),
                          month: DateTime.now().month.toString(),
                        );
                      },
                      child: CustomDoctorItem(
                        doctorDataModel: state.listOfdoctors[index],
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
                  itemCount: state.listOfdoctors.length,
                )
              : Center(
                  child: Text(
                    'لا يوجد أطباء بهذا الأسم',
                    style: Styles.styleBold24.copyWith(color: mainColor),
                  ),
                );
        } else if (state is SearchFailed) {
          return Center(
            child: Text(
              state.failureMessage,
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
          );
        } else if (state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else {
          return Center(
            child: Text(
              'أبدا البحث',
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
          );
        }
      },
    );
  }
}
