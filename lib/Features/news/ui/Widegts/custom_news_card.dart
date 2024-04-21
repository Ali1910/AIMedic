import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/news/data/news_model.dart';
import 'package:gbsub/Features/news/logic/news_cubit.dart';
import 'package:gbsub/Features/news/logic/news_states.dart';
import 'package:gbsub/Features/news/ui/Widegts/custom_icon_row.dart';
import 'package:gbsub/Features/news/ui/news_web_view.dart';

class CustomNewsCard extends StatelessWidget {
  const CustomNewsCard({
    super.key,
    required this.articalModel,
  });
  final ArticalModel articalModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return NewsWebView(
                url: articalModel.url,
              );
            },
          ),
        );
      },
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<NewsCubit, NeWsStates>(
                builder: (context, state) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      imageUrl: articalModel.image!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: double.infinity,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                articalModel.title,
                style: Styles.style16.copyWith(color: mainColor),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10.h,
              ),
              const IconRow(),
            ],
          ),
        ),
      ),
    );
  }
}
