import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/news/logic/news_cubit.dart';
import 'package:gbsub/Features/news/ui/news_view_body.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => NewsCubit(),
        child: const Scaffold(
          body: NewsViewBody(),
        ),
      ),
    );
  }
}
