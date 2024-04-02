import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/profile_page/logic/profile_cubit.dart';
import 'package:gbsub/Features/profile_page/ui/widgets/custom_profile_container.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<ProfileCubit>(context)
          .getprofiledetails(Sharedhelper.getintdata(intkey)),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CustomProfileConatiner(
              profileModel:
                  BlocProvider.of<ProfileCubit>(context).profileModel);
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: mainColor,
            ),
          );
        }
      },
    );
  }
}
