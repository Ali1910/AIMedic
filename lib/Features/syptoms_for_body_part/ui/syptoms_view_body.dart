import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/syptoms_for_body_part/logic/syptoms_cubit.dart';
import 'package:gbsub/Features/syptoms_for_body_part/ui/widgets/symptomsListView.dart';
import 'package:gbsub/core/utilts/style.dart';

class SyptomsViewBody extends StatelessWidget {
  const SyptomsViewBody({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<SyptomsCubit>(context).getSyptomsForBodyPart(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return const SyptomsListView();
        } else {
          return Center(
            child: Text(
              'تأكد من ألأاتصال بالأنترنت',
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
          );
        }
      },
    );
  }
}
