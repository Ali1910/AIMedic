import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/SignUp/Logic/signup_cubit.dart';

class CustomProfilePictuteProfileView extends StatelessWidget {
  const CustomProfilePictuteProfileView({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: CircleAvatar(
          radius: 60.w,
          child: Stack(children: [
            BlocProvider.of<SignUpCubit>(context).imagePicked
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(60.w),
                    child: Image.file(
                        BlocProvider.of<SignUpCubit>(context).selectedImage!,
                        width: 120.w,
                        height: 120.h,
                        fit: BoxFit.cover),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(60.w),
                    child: Image.asset(
                      'assets/images/profile.png',
                      height: 120.h,
                      width: 120.w,
                      fit: BoxFit.cover,
                    ),
                  ),
            Positioned(
              top: 95.h,
              left: 90.w,
              child: CircleAvatar(
                radius: 12.w,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: mainColor,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
