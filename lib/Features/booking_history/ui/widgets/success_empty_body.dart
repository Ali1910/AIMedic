import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/core/utilts/style.dart';

class ScuccesEmptyBody extends StatelessWidget {
  const ScuccesEmptyBody({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.boxArchive,
            size: 100.w,
            color: Colors.grey.shade600,
          ),
          SizedBox(
            height: 25.h,
          ),
          Text(
            text,
            style: Styles.style16.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
