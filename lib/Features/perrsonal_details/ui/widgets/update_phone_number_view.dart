import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/perrsonal_details/logic/personal_details_cubit.dart';
import 'package:gbsub/Features/perrsonal_details/ui/widgets/update_phone_number_view_body.dart';

class UpdatePhoneNumberView extends StatelessWidget {
  const UpdatePhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalDetailsCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(),
          body: const UpdatePhoneNumberViewBody(),
        ),
      ),
    );
  }
}
