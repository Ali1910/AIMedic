import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/syptoms_for_body_part/ui/syptoms_view.dart';

class GroupCardELement extends StatelessWidget {
  const GroupCardELement({
    super.key,
    required this.name,
    required this.id,
  });
  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SyptomsView(
                id: id,
              );
            },
          ),
        );
      },
      child: Card(
        elevation: 0.7,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Text(
                    name,
                    style: Styles.style20.copyWith(color: mainColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
