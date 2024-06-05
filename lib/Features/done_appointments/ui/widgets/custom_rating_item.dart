import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/booking_history/data/appointment_data_model_dto.dart.dart';
import 'package:gbsub/Features/done_appointments/ui/widgets/Custom_rating_text_form_feild.dart';
import 'package:gbsub/Features/done_appointments/ui/widgets/custom_rating_bar..dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    required this.appointmentDataModel,
  });
  final AppointmentDateModelDTO appointmentDataModel;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.h,
          ),
          CustomDoneAppointmentRatingTextFormFeild(
            label: 'اضف تعليق اذا اردت',
            onChanged: (v) {
              BlocProvider.of<MainCubit>(context).comment = v;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          const CustomRatingBar(),
          SizedBox(
            height: 20.h,
          ),
          Customelevatedbutton(
            text: 'أضافة',
            onPressed: () async {
              var of = BlocProvider.of<MainCubit>(context);
              var bool = await BlocProvider.of<MainCubit>(context).addRating(
                appointmentDataModel.dcotorid,
                appointmentDataModel.id,
                of.comment,
                of.ratingValue,
              );
              if (bool) {
                Navigator.pop(context);
              } else {
                customSnackBar(context, 'حدث خطأ اثناء التقييم حاول مرة أخرى',
                    correctColors: false);
                Navigator.pop(context);
              }
            },
            width: 150,
            height: 40,
          )
        ],
      ),
    );
  }
}
