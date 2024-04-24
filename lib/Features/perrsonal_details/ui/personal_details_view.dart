import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/perrsonal_details/ui/personal_details_view_body.dart';
import 'package:gbsub/Features/profile_page/data/profile_model.dart';

class PersonalDetialsView extends StatelessWidget {
  const PersonalDetialsView({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'بياناتك شخصية',
            style: Styles.styleBold16.copyWith(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: PersonalDetailsViewBody(
          profileModel: profileModel,
        ),
      ),
    );
  }
}
