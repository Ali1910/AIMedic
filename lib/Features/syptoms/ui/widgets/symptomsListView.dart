import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/custom_elevated_button_button.dart';
import 'package:gbsub/Features/syptoms/logic/syptoms_cubit.dart';
import 'package:gbsub/Features/syptoms/logic/syptoms_states.dart';
import 'package:gbsub/Features/syptoms/ui/widgets/syptoms_element.dart';

class SyptomsListView extends StatelessWidget {
  const SyptomsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return CustomSyptomElement(
                name: BlocProvider.of<SyptomsCubit>(context)
                    .listOfSymptoms[index]
                    .name,
                ename: BlocProvider.of<SyptomsCubit>(context)
                    .listOfSymptoms[index]
                    .eName,
                index: index,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 5.h,
              );
            },
            itemCount:
                BlocProvider.of<SyptomsCubit>(context).listOfSymptoms.length,
          ),
        ),
      ),
      BlocBuilder<SyptomsCubit, SyptomsStates>(
        builder: (context, state) {
          return SliverToBoxAdapter(
            child: BlocProvider.of<SyptomsCubit>(context).predicted
                ? Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(16.w)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Center(
                        child: Text(
                          BlocProvider.of<SyptomsCubit>(context).prediction,
                          style:
                              Styles.styleBold16.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
          );
        },
      ),
      SliverFillRemaining(
        child: Column(
          children: [
            const Spacer(),
            Customelevatedbutton(
              text: 'تنبؤ',
              onPressed: () async {
                BlocProvider.of<SyptomsCubit>(context).getPrediction();
              },
            ),
            const Spacer(),
          ],
        ),
      )
    ]);
  }
}
