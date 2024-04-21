import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/news/logic/news_cubit.dart';
import 'package:gbsub/Features/news/ui/Widegts/custom_news_falied_body.dart';
import 'package:gbsub/Features/news/ui/Widegts/custom_news_loading_body.dart';
import 'package:gbsub/Features/news/ui/Widegts/custom_news_success_body.dart';

class NewsViewBody extends StatelessWidget {
  const NewsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<NewsCubit>(context).getMedicalNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const NewsLoadingBody();
        } else if (snapshot.hasError) {
          return const NewsFailBody();
        } else {
          return const NewsSuccessBody();
        }
      },
    );
  }
}
