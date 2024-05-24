import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/syptoms_for_body_part/logic/syptoms_cubit.dart';
import 'package:gbsub/Features/syptoms_for_body_part/ui/syptoms_view_body.dart';

class SyptomsView extends StatelessWidget {
  const SyptomsView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SyptomsCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: const CustomAppbar(title: 'الأعراض'),
          body: SyptomsViewBody(id: id),
        ),
      ),
    );
  }
}
