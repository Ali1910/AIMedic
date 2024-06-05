import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Features/done_appointments/ui/widgets/empty_star.dart';
import 'package:gbsub/Features/done_appointments/ui/widgets/full_star.dart';
import 'package:gbsub/Features/done_appointments/ui/widgets/half_star.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: RatingBar(
        allowHalfRating: true,
        initialRating: 3,
        minRating: 1,
        maxRating: 5,
        onRatingUpdate: (double value) {
          BlocProvider.of<MainCubit>(context).ratingValue = value;
        },
        ratingWidget: RatingWidget(
            full: const FullStar(),
            half: const HalfStar(),
            empty: const EmptyStar()),
        glow: false,
        updateOnDrag: true,
        itemSize: 30.w,
      ),
    );
  }
}
