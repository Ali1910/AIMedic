import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/personal_details/ui/personal_details_view_body.dart';
import 'package:gbsub/Features/profile_page/data/profile_model.dart';

class PersonalDetialsView extends StatelessWidget {
  const PersonalDetialsView({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppbar(title: 'بياناتك الشخصية'),
        body: PersonalDetailsViewBody(
          profileModel: profileModel,
        ),
      ),
    );
  }
}
