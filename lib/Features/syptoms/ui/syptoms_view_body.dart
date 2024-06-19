import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/widgets/failed_body.dart';
import 'package:gbsub/Core/utilts/widgets/loading_body.dart';
import 'package:gbsub/Core/utilts/widgets/success_empty_body.dart';
import 'package:gbsub/Features/syptoms/logic/syptoms_cubit.dart';
import 'package:gbsub/Features/syptoms/ui/widgets/symptomsListView.dart';

class SyptomsViewBody extends StatelessWidget {
  const SyptomsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<SyptomsCubit>(context).getSyptoms(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingBody();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data.isNotEmpty
              ? const SyptomsListView()
              : const ScuccesEmptyBody(text: 'لم يتم أضافة أعراض بعد');
        } else {
          return const FailedBody(text: 'تأكد من ألأاتصال بالأنترنت');
        }
      },
    );
  }
}
