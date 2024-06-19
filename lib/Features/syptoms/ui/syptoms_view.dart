import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/syptoms/logic/syptoms_cubit.dart';
import 'package:gbsub/Features/syptoms/ui/syptoms_view_body.dart';

class SyptomsView extends StatelessWidget {
  const SyptomsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SyptomsCubit(),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: CustomAppbar(title: 'التشخيص'),
          body: SyptomsViewBody(),
        ),
      ),
    );
  }
}
