import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Features/news/logic/news_cubit.dart';
import 'package:gbsub/Features/news/ui/Widegts/custom_news_card.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: BlocProvider.of<NewsCubit>(context).newsarticals.length,
      itemBuilder: (context, index) {
        return CustomNewsCard(
          articalModel: BlocProvider.of<NewsCubit>(context).newsarticals[index],
        );
      },
    );
  }
}
