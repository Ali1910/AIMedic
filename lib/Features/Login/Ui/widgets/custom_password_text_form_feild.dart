import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/Login/Logic/LoginCubit.dart';

import '../../../../../core/utilts/style.dart';

class CustomPasswordTextFormFeild extends StatelessWidget {
  const CustomPasswordTextFormFeild(
      {super.key, required this.onChanged, required this.onSaved});
  final void Function(String) onChanged;
  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      obscureText: BlocProvider.of<Logincubit>(context).isobscure,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'هذا الحقل مطلوب لا يمكن ان يكون فارغا';
        }
        // if (!BlocProvider.of<Logincubit>(context)
        //     .validateCpatialStructure(value!)) {
        //   return 'من فضلك ادخل باسورد مناسب ';
        // }
        return null;
      },
      maxLines: 1,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(BlocProvider.of<Logincubit>(context).isobscure
              ? Icons.visibility_off
              : Icons.visibility),
          onPressed: () {
            BlocProvider.of<Logincubit>(context).showpassword();
          },
        ),
        suffixIconColor: Styles.textFormFeidlIconStylye(),
        hintText: 'ادخل كلمة السر الخاص بك هنا ',
        hintStyle: Styles.style16.copyWith(
          color: Colors.grey.withOpacity(0.7),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: Styles.borderStyle(
          Colors.grey.withOpacity(0.5),
        ),
        focusedBorder: Styles.borderStyle(
          mainColor.withOpacity(0.7),
        ),
      ),
    );
  }
}
