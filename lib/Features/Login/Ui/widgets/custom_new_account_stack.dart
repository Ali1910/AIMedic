import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/style.dart';

class CreateNewAccountStack extends StatelessWidget {
  const CreateNewAccountStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Divider(
          color: const Color(0xffD7D7D7),
          endIndent: 20.w,
          indent: 20.w,
        ),
        Transform.translate(
          offset: Offset(0, -5.h),
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.h),
              color: Colors.white,
              child: Text(
                'او قم بانشاء حساب جديد',
                style: Styles.style11
                    .copyWith(color: Colors.grey.withOpacity(0.9)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
