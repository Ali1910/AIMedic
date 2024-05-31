import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/api_services.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/search_for_doctor/logic/cubit/repo/search_repo_implementation.dart';
import 'package:gbsub/Features/search_for_doctor/logic/cubit/search_cubit.dart';
import 'package:gbsub/Features/search_for_doctor/ui/widgets/custom_search_text_form_feild.dart';
import 'package:gbsub/Features/search_for_doctor/ui/widgets/success_doctor_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.spec});
  final String spec;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchCubit(SearchRepoImplementation(aPiService: APiService(Dio()))),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: mainColor),
            centerTitle: true,
            title: CustomSearchTextFormFeild(spec: spec),
          ),
          body: const SuccessDoctorViewBody(),
        ),
      ),
    );
  }
}
